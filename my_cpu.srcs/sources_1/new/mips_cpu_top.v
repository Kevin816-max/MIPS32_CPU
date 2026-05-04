`include "defines.v"
module mips_cpu_top(

	input	wire	clk,
	input wire	rst,
	output wire[255:0] reg_data
);

  wire[`InstAddrBus] inst_addr;
  wire[`InstBus] inst;
  wire rom_ce;
 
mips_cpu mips_cpu0(
		.clk(clk),
		.rst(rst),
		.rom_data_i(inst),
		
		.rom_addr_o(inst_addr),
		.rom_ce_o(rom_ce),
		.reg_data(reg_data)
	
	);
	
	inst_rom inst_rom0(
		.ce(rom_ce),
		.addr(inst_addr),
		
		.inst(inst)	
	);
endmodule

