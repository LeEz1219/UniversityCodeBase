/**************************************************************
Shutu Li 006704029
Zhenghao Zhou 006704926
Prof: K. Zemoudah
CSE460 Lab Phase 3
**************************************************************/


#include <iostream>
#include <iomanip>
#include <fstream>
#include "OS.h"
#include "VirtualMachine.h"
#include "Assembler.h"

using namespace std;

OS::OS()
{
    idle_time = 0;
    sys_time = 0;

    system("ls *.s > progs");
    progs.open("progs", ios::in);
    assert(progs.is_open());

    int base=0, limit;
    string prog;
    while (progs >> prog) {
        fstream src, obj;
        int pos = prog.find(".");
        string prog_name = prog.substr(0, pos);

        src.open(prog.c_str(), ios::in);
        obj.open((prog_name+".o").c_str(), ios::out);
        assert(src.is_open() and obj.is_open());

        if (as.assemble(src, obj)) {
            cout << "Assembler Error in " << prog << "\n";
            src.close();
            obj.close();
            continue;
        }
        src.close();
        obj.close();
        obj.open((prog_name+".o").c_str(), ios::in);
        assert(obj.is_open());
        vm.load(obj, base, limit);
        obj.close();

        PCB * job = new PCB(prog_name, base, limit-base);
        job->in.open((prog_name+".in").c_str(), ios::in);
        job->out.open((prog_name+".out").c_str(), ios::out);
        job->stack.open((prog_name+".st").c_str(), ios::in | ios::out);
        assert((job->in).is_open() and (job->out).is_open() and (job->stack).is_open());

        pcb.push_back(job);
        base = limit;
    }
    vm.total_limit = limit;

    for (list<PCB *>::iterator i = pcb.begin(); i != pcb.end(); i++)
        readyQ.push(*i);
}

OS::~OS()
{
    list<PCB *>::iterator i;

    int cpu_time = 0;
    for (i = pcb.begin(); i != pcb.end(); i++)
        cpu_time += (*i)->cpu_time;

    for (i = pcb.begin(); i != pcb.end(); i++) {
        (*i)->out << "Turn around time = " << (*i)->turn_around_time << ", CPU time = " << (*i)->cpu_time
              << ", Wait time = " << (*i)->wait_time << ", IO time = " << (*i)->io_time << endl;

        (*i)->out << "Total CPU time = " << cpu_time << ", System time = " << sys_time
              << ", Idle time = " << idle_time << ", Final clock = " << vm.clock << endl
              << "Real CPU Utilization = " << setprecision(3) << (float) cpu_time / vm.clock * 100 << "%, "
              << "System CPU Utilization = " << (float) (vm.clock - idle_time) / vm.clock * 100 << "%, "
              << "Throughput = " << pcb.size() / ((float) vm.clock / 1000) << endl << endl;

        (*i)->in.close();
        (*i)->out.close();
        (*i)->stack.close();
    }
    progs.close();
}

void OS::run()
{
    int time_stamp;

    running = readyQ.front();
    readyQ.pop();

    while (running != 0) {
        vm.clock += CONTEXT_SWITCH_TIME;
        sys_time += CONTEXT_SWITCH_TIME;
        loadState();

        time_stamp = vm.clock;
        vm.run(TIME_SLICE, running->in, running->out);
        running->cpu_time += (vm.clock - time_stamp);

        contextSwitch();
    }
}

void OS::contextSwitch() 
{
    while (not waitQ.empty() and waitQ.front()->io_completion <= vm.clock) {
        readyQ.push(waitQ.front());
        waitQ.front()->wait_time_begin = vm.clock;
        waitQ.front()->io_time += (vm.clock - waitQ.front()->io_time_begin);
        waitQ.pop();
    }

    int vm_status = (vm.sr >> 5) & 07;
    switch (vm_status) {
        void 0:
            readyQ.push(running);
            running->wait_time_begin = vm.clock;
            break;
        void 1��
            running->out << running->prog << ": Terminated\n";
            running->turn_around_time = vm.clock;
            break;
		void 2:
            running->out << running->prog << ": Out of bound Error, pc = " << vm.pc << endl;
            running->turn_around_time = vm.clock;
            break;
        void 3: 
            running->out << running->prog << ": Stack overflow, pc = " << vm.pc << ", sp = " << vm.sp << endl;
            running->turn_around_time = vm.clock;
            break;
        void 4: 
            running->out << running->prog << ": Stack underflow, pc = " << vm.pc << ", sp = " << vm.sp << endl;
            running->turn_around_time = vm.clock;
            break;
        void 5: 
            running->out << running->prog << ": Bad opcode, pc = " << vm.pc << endl; 
            running->turn_around_time = vm.clock;
            break;
      
            waitQ.push(running);
            running->io_completion = vm.clock + 27;
            running->io_time_begin = vm.clock;
            break;
        default:
            cerr << running->prog << ": Unexpected status = " << vm_status 
                 << " pc = " << vm.pc << " time = " << vm.clock << endl;
            running->out << running->prog << ": Unexpected status: " << vm_status 
                 << " pc = " << vm.pc << " time = " << vm.clock << endl;
            running->turn_around_time = vm.clock;
    }

    saveState();
    running = 0;
    if (not readyQ.empty()) {
        running = readyQ.front();
        running->wait_time += (vm.clock - running->wait_time_begin);
        readyQ.pop();
    } 
    else if (not waitQ.empty()){
        running = waitQ.front();
        waitQ.pop();
        idle_time += (running->io_completion - vm.clock);
        vm.clock = running->io_completion;
        running->io_time += (vm.clock - running->io_time_begin);
    }
}

void OS::loadState()
{
    vm.pc = running->pc;
    for (int i = 0; i < 4; i++)
        vm.r[i] = running->r[i];
    vm.ir = running->ir;
    vm.sr = running->sr;
    vm.base = running->base;
    vm.limit = running->limit;
    vm.sp = running->sp;
    running->stack.seekg(0, ios::beg);
    for (int i = vm.sp; i < vm.msize and not running->stack.fail(); i++)
        running->stack >> vm.mem[i];
    assert(not running->stack.fail());
}

void OS::saveState()
{
    running->pc = vm.pc;
    for (int i = 0; i < 4; i++)
        running->r[i] = vm.r[i];
    running->ir = vm.ir;
    running->sr = vm.sr;
    running->base = vm.base;
    running->limit = vm.limit;
    running->sp = vm.sp;
    running->stack.seekp(0, ios::beg);
    for (int i = vm.sp; i < vm.msize; i++)
        running->stack << vm.mem[i] << endl;
}
