`timescale 1ns / 1ps

module CPU2025(
	input	wire clk,
	input wire	rst,
    input wire[2:0] SW,           

    output wire[7:0] seg,
    output wire[7:0] seg1,
    output wire[7:0] an 
    );
    wire[255:0] reg_data;
    reg [31:0] count = 0;
    reg div_clk = 0;

     always @(posedge clk) begin
        if(count >= 37500000) begin
            div_clk <= ~div_clk;
            count <= 0;
        end
        else begin
            count <= count + 1;
        end
    end
    
    mips_cpu_top mips_cpu_top0(
    .clk(div_clk),
    .rst(rst),
    .reg_data(reg_data)
    );
    
    cpushow cpushow0(
    .clk(clk),
    .rst(rst),
    .SW(SW),
    .rf_data(reg_data),
    .seg_o(seg),
    .seg1_o(seg1),
    .an_o(an)
    );
endmodule
