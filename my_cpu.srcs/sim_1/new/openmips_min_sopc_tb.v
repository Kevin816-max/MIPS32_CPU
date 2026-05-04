`include "defines.v"
`timescale 1ns/1ps

module openmips_min_sopc_tb();

  reg     CLOCK_50;
  reg     rst;
  reg BTN;
  reg [2:0] SW;
   wire[7:0] seg;//段选，高有效
   wire[7:0] seg1;
   wire[7:0] an;//位选，低有效
  initial begin
    CLOCK_50 = 1'b0;
    forever #1 CLOCK_50 = ~CLOCK_50;
  end
  
  initial begin
    BTN=1'b0;
   end
  initial begin
    SW = 3'b000; 
   end
  initial begin
        rst= `RstDisable;
  end
       
  OURCPU OURCPU0(
		.clk(CLOCK_50),
		.rst(rst),
//		.BTN(BTN),
		.SW(SW),
		.seg(seg),
		.seg1(seg1),
		.an(an)
	);

endmodule