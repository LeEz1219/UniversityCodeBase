#include <iostream>
#include <sstream>
#include <string>
#include <stdlib.h>
#include "filesys.h"
#include "sdisk.h"
#include "shell.h"
#include "table.h"
using namespace std;

int static blocksize = 128;
int static numberofblocks = 256;
static string disk_name = "disk1", flatfile = "flatF", index = "index";

int main()
{
    //This main program inputs commands to the shell.
    //It inputs commands as : command op1 op2
    //You should modify it to work for your implementation.
    string s;
    string command="go";
    Shell terminal(disk_name, blocksize, numberofblocks);
    Table table(disk_name, blocksize, numberofblocks, flatfile, index);
    //terminal.clear();
    while (command != "quit")
    {
        string op1, op2;
        cout << "$ ";
        getline(cin,s);
        istringstream instream(s);
        instream >> command >> op1 >> op2;
        // cout << "Command:" << command << " op1:" << op1 << " op2:" << op2 << endl;
        if (command == "dir")
            terminal.dir();

        if (command == "add") {
            // The variable op1 is the new file
            if(terminal.add(op1) == 0) 
                cout << "File already exists\n";
            else
                cout << "File " << op1 << " was created\n";
        }

        if (command == "del") {
            if(terminal.del(op1) == 0)
                cout << op1 << " doesn't exist\n";
            else
                cout << op1 << " was deleted\n";
        }

        if (command == "type")
            terminal.type(op1);    

       // if(command == "clear")
         //   terminal.clear();
        
        if (command == "copy")
            terminal.copy(op1, op2);

        if(command == "table") {
            if(op1.size() == 0) 
                cout << "Command not known, syntax 'table souce_file.txt'\n";
            else 
                table.build_table(op1);
        }

        if(command == "search") {
            string input;
            cout << "\"q\" to quit\nSearch record by date:";
            cin >> input;
            while(input != "q") {
                int block = table.search(input);
                if(block != 0) {
                    string buffer;
                    block = table.readblock(flatfile, block, buffer);
                    if(block != -1) {
                        istringstream output(buffer);
                        while(output >> buffer && buffer[0] != '#')
                            cout << buffer << " ";

                        cout << endl;
                    } else{
                        cout << "Could not find date in database.\n";
		    }
                } else 
                    cout << "Didn't find anything\n";

                cout << "Search record by date:";
                cin >> input;
            }
            cout << "$\n";
            getline(cin,s);
        }
            
    }
    return 0;
}
