`include "defines.v"

module pc_reg(

	input	wire		clk,
	input wire			rst,

	//来自控制模块的信息
	input wire[5:0]      stall,
	
	output reg[`InstAddrBus]	pc,//在指令寄存器的位置
	output reg    ce//是否禁用指令寄存器
	
);
        initial begin
                pc=32'h00000000;
        end

	always @ (posedge clk) begin
		if (ce == `ChipDisable) begin
			pc <= 32'h00000000;
		end else if(pc==32'h00040000) begin
		end
		else if(stall[0] == `NoStop) begin
		  		pc <= pc + 4'h4;
		end
	end
	
	always @ (posedge clk) begin
		if (rst == `RstEnable) begin
			ce <= `ChipDisable;
		end else begin
			ce <= `ChipEnable;
		end
	end

endmodule