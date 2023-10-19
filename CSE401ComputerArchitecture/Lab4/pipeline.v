// Class: CSCI 401 Computer Architecture
//
// Lab #1: Instruction Fetch Stage

//                              -*- Mode: Verilog -*-
// Filename        : pipeline.v
// Description     : The pipeline module which simulates the
//                   function of the IF stage of the pipeline
// Authors         : George M. Georgiou and Scott McWilliams
// Created On      : 2/06/2003
// Modified On     : 4/5/2011
// Modified By     : Jason Fredrick and David Sturgeon

//`include "ifetch.v"

`timescale 1ns / 1ps

module pipeline ();

    wire    [31:0]      IF_ID_instr, IF_ID_npc;
    wire                EX_MEM_PCSrc;
    wire    [31:0]      EX_MEM_NPC;
//  reg     [31:0]      IF_ID_instrout;         //input
//  reg     [31:0]      IF_ID_npcout;           //input
    wire    [4:0]       MEM_WB_rd;              //input
    wire                MEM_WB_regwrite;        //input
    reg     [31:0]      WB_mux5_writedata;      //input
    wire    [1:0]       wb_ctlout;              //output
    wire    [2:0]       m_ctlout;               //output
    wire                regdst;                 //output
    wire                alusrc;                 //output
    wire    [1:0]       aluop;                  //output
    wire    [31:0]      npcout;                 //output
    wire    [31:0]      rdata1out;              //output
    wire    [31:0]      rdata2out;              //output
    wire    [31:0]      s_extendout;            //output
    wire    [4:0]       instrout_2016;          //output
    wire    [4:0]       instrout_1511;          //output
    wire    [31:0]      addr;     
    wire    [31:0]      mux_out;
    wire    [1:0]       wb_ctl;
    wire                branch;
    wire                memread;
    wire                memwrite;
    wire                zero;
    wire    [31:0]      alu_result;
    wire    [31:0]      rdata2;
    wire    [4:0]       five_bit_muxout;

   I_FETCH I_FETCH1(
        .IF_ID_instr(IF_ID_instr),
        .IF_ID_npc(IF_ID_npc),
        .EX_MEM_PCSrc(EX_MEM_PCSrc),
        .EX_MEM_NPC(EX_MEM_NPC) 
    );
    
    initial begin
    //EX_MEM_PCSrc <= 0;
    //EX_MEM_NPC    <= 0;
    //MEM_WB_rd <= 5'd0;
    WB_mux5_writedata <= 32'h00000000;
    //MEM_WB_regwrite <= 1'b0;
    end
    
IDECODE IDECODE_inst(
    .IF_ID_instrout(IF_ID_instr),            //input        wire    [31:0]  
    .IF_ID_npcout(IF_ID_npc),                //input        wire    [31:0]  
    .MEM_WB_rd(MEM_WB_rd),                   //input        wire    [4:0]   
    .MEM_WB_regwrite(MEM_WB_regwrite),       //input        wire            
    .WB_mux5_writedata(WB_mux5_writedata),   //input        wire    [31:0]  
    .wb_ctlout(wb_ctlout),                   //output       wire    [1:0]   
    .m_ctlout(m_ctlout),                     //output       wire    [2:0]   
    .regdst(regdst),                         //output       wire            
    .alusrc(alusrc),                         //output       wire            
    .aluop(aluop),                           //output       wire    [1:0]   
    .npcout(npcout),                         //output       wire    [31:0]  
    .rdata1out(rdata1out),                   //output       wire    [31:0]  
    .rdata2out(rdata2out),                   //output       wire    [31:0]  
    .s_extendout(s_extendout),               //output       wire    [31:0]  
    .instrout_2016(instrout_2016),           //output       wire    [4:0]   
    .instrout_1511(instrout_1511)            //output       wire    [4:0]   
);
   
   EXECUTE EXECUTE_inst(
    .wb_ctl(wb_ctlout),                     //  input       wire    [1:0]   
    .m_ctl(m_ctlout),                       //  input       wire    [2:0]   
    .regdst(regdst),                        //  input       wire            
    .alusrc(alusrc),                        //  input       wire            
    .aluop(aluop),                          //  input       wire    [1:0]   
    .npcout(npcout),                        //  input       wire    [31:0]  
    .rdata1(rdata1out),                     //  input       wire    [31:0]  
    .rdata2(rdata2out),                     //  input       wire    [31:0]  
    .s_extendout(s_extendout),              //  input       wire    [31:0]  
    .instrout_2016(instrout_2016),          //  input       wire    [4:0]   
    .instrout_1511(instrout_1511),          //  input       wire    [4:0]   
    .wb_ctlout(wb_ctl),                     //  output      wire    [1:0]   
    .branch(branch),                        //  output      wire            
    .memread(memread),                      //  output      wire            
    .memwrite(memwrite),                    //  output      wire            
    .EX_MEM_NPC(EX_MEM_NPC),                //  output      wire    [31:0]  
    .zero(zero),                            //  output      wire            
    .alu_result(alu_result),                //  output      wire    [31:0]  
    .rdata2out(rdata2),                     //  output      wire    [31:0]  
    .five_bit_muxout(five_bit_muxout)       //  output      wire    [4:0]   
    );
   
   MEMORY MEMORY_inst(
    .wb_ctlout(wb_ctl),                     //  input       wire    [1:0]   
    .branch(branch),                        //  input       wire            
    .memread(memread),                      //  input       wire            
    .memwrite(memwrite),                    //  input       wire            
    .zero(zero),                            //  input       wire            
    .alu_result(alu_result),                //  input       wire    [31:0]  
    .rdata2out(rdata2),                     //  input       wire    [31:0]  
    .five_bit_muxout(five_bit_muxout),      //  input       wire    [4:0]   
    .MEM_PCSrc(EX_MEM_PCSrc),               //  output  wire                
    .MEM_WB_regwrite(MEM_WB_regwrite),      //  output  wire                
    .MEM_WB_memtoreg(),                     //  output  wire                
    .read_data(),                           //  output  wire    [31:0]      
    .mem_alu_result(),                      //  output  wire    [31:0]      
    .mem_write_reg(MEM_WB_rd)               //  output  wire    [4:0]       
    );
   
// Here you will add I_DECODE.  You will have to declare wires to make 
// the connections between the I_FETCH and I_DECODE modules

endmodule // pipeline





