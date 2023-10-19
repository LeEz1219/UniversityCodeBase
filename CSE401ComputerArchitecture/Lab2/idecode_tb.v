`timescale 1ns / 1ps

module idecode_tb();

reg  [31:0] IF_ID_instrout;         //input
reg  [31:0] IF_ID_npcout;       //input
reg   [4:0]     MEM_WB_rd;          //input
reg             MEM_WB_regwrite;    //input
reg   [31:0]    WB_mux5_writedata;  //input
wire  [1:0]     wb_ctlout;          //output
wire  [2:0]     m_ctlout;           //output
wire            regdst;             //output
wire            alusrc;             //output
wire  [1:0]     aluop;              //output
wire  [31:0]    npcout;             //output
wire  [31:0]    rdata1out;          //output
wire  [31:0]    rdata2out;          //output
wire  [31:0]    s_extendout;        //output
wire  [4:0]     instrout_2016;      //output
wire  [4:0]     instrout_1511;       //output
wire  [31:0]        addr;     
wire  [31:0]        mux_out;
    
IDECODE IDECODE_inst(
    .IF_ID_instrout(IF_ID_instrout),
    .IF_ID_npcout(IF_ID_npcout),
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
/*
memory memory_inst (
   .data(IF_ID_instrout),       // Output of Instruction Memory
   .addr(addr)        // Input of Instruction Memory
   );

pc_mod pc_mod_inst (
   .PC(addr),             // Output of pc_mod
   .npc(mux_out)             // Input of pc_mod
   );
   
mux mux_inst (
   .y(mux_out),     // Output of Multiplexer
   .a(addr_out),     // Input 1 of Multiplexer
   .b(),     // Input 0 of Multiplexer
   .sel()           // Select Input
   );

I_FETCH I_FETCH_inst (
   .IF_ID_instr(),
   .IF_ID_npc(),
   .EX_MEM_PCSrc(),
   .EX_MEM_NPC()
);
 */  
 
 
    initial 
    begin
// 002300AA
// 10654321
// 00100022
// 8C123456
// 8F123456
// AD654321
// 13012345
// AC654321
// 12012345
        #10;
        IF_ID_instrout <= 32'h002300AA;
        IF_ID_npcout <= 32'h00000000;
        MEM_WB_rd <= 5'd0;
        WB_mux5_writedata <= 32'h00000000;
        MEM_WB_regwrite <= 1'b1;
        #10;
        MEM_WB_regwrite <= 1'b1;
        
        #10;
        IF_ID_instrout <= 32'h10654321;
        IF_ID_npcout <= 32'h00000001;
        MEM_WB_rd <= 5'd1;
        WB_mux5_writedata <= 32'h11111111;
        MEM_WB_regwrite <= 1'b1;
        #10;
        MEM_WB_regwrite <= 1'b1;
    
        #10;
        IF_ID_instrout <= 32'h00100022;
        IF_ID_npcout <= 32'h00000002;
        MEM_WB_rd <= 5'd2;
        WB_mux5_writedata <= 32'h22222222;
        MEM_WB_regwrite <= 1'b1;
        #10;
        MEM_WB_regwrite <= 1'b1;

        #10;
        IF_ID_instrout <= 32'h8C123456;
        IF_ID_npcout <= 32'h00000003;
        MEM_WB_rd <= 5'd3;
        WB_mux5_writedata <= 32'h33333333;
        MEM_WB_regwrite <= 1'b1;
        #10;
        MEM_WB_regwrite <= 1'b1;

        #10;
        IF_ID_instrout <= 32'h8F123456;
        IF_ID_npcout <= 32'h00000004;
        MEM_WB_rd <= 5'd4;
        WB_mux5_writedata <= 32'h44444444;
        MEM_WB_regwrite <= 1'b1;
        #10;
        MEM_WB_regwrite <= 1'b1;
        
        #10;
        IF_ID_instrout <= 32'hAD654321;
        IF_ID_npcout <= 32'h00000005;
        MEM_WB_rd <= 5'd5;
        WB_mux5_writedata <= 32'h55555555;
        MEM_WB_regwrite <= 1'b1;
        #10;
        MEM_WB_regwrite <= 1'b1;
        
        #10;
        IF_ID_instrout <= 32'h13012345;
        IF_ID_npcout <= 32'h00000006;
        MEM_WB_rd <= 5'd6;
        WB_mux5_writedata <= 32'h66666666;
        MEM_WB_regwrite <= 1'b1;
        #10;
        MEM_WB_regwrite <= 1'b1;
        
        #10;
        IF_ID_instrout <= 32'hAC654321;
        IF_ID_npcout <= 32'h00000007;
        MEM_WB_rd <= 5'd7;
        WB_mux5_writedata <= 32'h77777777;
        MEM_WB_regwrite <= 1'b1;
        #10;
        MEM_WB_regwrite <= 1'b1;
        
        #10;
        IF_ID_instrout <= 32'h12012345;
        IF_ID_npcout <= 32'h00000008;
        MEM_WB_rd <= 5'd8;
        WB_mux5_writedata <= 32'h88888888;
        MEM_WB_regwrite <= 1'b1;
        #10;
        MEM_WB_regwrite <= 1'b1;
        
    end
 
endmodule 
