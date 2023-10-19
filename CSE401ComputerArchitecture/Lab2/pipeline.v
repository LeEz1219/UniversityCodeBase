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
    reg                 EX_MEM_PCSrc;
    reg     [31:0]      EX_MEM_NPC;
    reg     [31:0]      IF_ID_instrout;         //input
    reg     [31:0]      IF_ID_npcout;       //input
    reg     [4:0]       MEM_WB_rd;          //input
    reg                 MEM_WB_regwrite;    //input
    reg     [31:0]      WB_mux5_writedata;  //input
    wire    [1:0]       wb_ctlout;          //output
    wire    [2:0]       m_ctlout;           //output
    wire                regdst;             //output
    wire                alusrc;             //output
    wire    [1:0]       aluop;              //output
    wire    [31:0]      npcout;             //output
    wire    [31:0]      rdata1out;          //output
    wire    [31:0]      rdata2out;          //output
    wire    [31:0]      s_extendout;        //output
    wire    [4:0]       instrout_2016;      //output
    wire    [4:0]       instrout_1511;       //output
    wire    [31:0]      addr;     
    wire    [31:0]      mux_out;

   I_FETCH I_FETCH1(
        .IF_ID_instr(IF_ID_instr),
        .IF_ID_npc(IF_ID_npc),
        .EX_MEM_PCSrc(EX_MEM_PCSrc),
        .EX_MEM_NPC(EX_MEM_NPC) 
    );
    
    initial begin
    EX_MEM_PCSrc <= 0;
    EX_MEM_NPC  <= 0;
    MEM_WB_rd <= 5'd0;
    WB_mux5_writedata <= 32'h00000000;
    MEM_WB_regwrite <= 1'b0;
    end
    
IDECODE IDECODE_inst(
    .IF_ID_instrout(IF_ID_instr),
    .IF_ID_npcout(IF_ID_npc),
    .MEM_WB_rd(MEM_WB_rd),
    .MEM_WB_regwrite(MEM_WB_regwrite),
    .WB_mux5_writedata(WB_mux5_writedata),
    .wb_ctlout(wb_ctlout),
    .m_ctlout(m_ctlout),
    .regdst(regdst),
    .alusrc(alusrc),
    .aluop(aluop), 
    .npcout(npcout),
    .rdata1out(rdata1out),
    .rdata2out(rdata2out), 
    .s_extendout(s_extendout),
    .instrout_2016(instrout_2016),
    .instrout_1511(instrout_1511)
);
   
// Here you will add I_DECODE.  You will have to declare wires to make 
// the connections between the I_FETCH and I_DECODE modules

endmodule // pipeline





