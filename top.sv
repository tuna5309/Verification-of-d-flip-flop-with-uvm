`include "uvm_pkg.sv"

import uvm_pkg::*;

`include "uvm_macros.svh"
`include "d_interface.sv"
`include "dff.sv"
`include "df_data.sv"
`include "d_sequence.sv"
`include "d_sequencer.sv"
`include "d_driver.sv"
`include "d_monitor.sv"
`include "d_agent.sv"
`include "d_scoreboard.sv"
`include "d_env.sv"
`include "test.sv"

module top;
df_intf cif();
dff DUT(.clk(cif.clk),.reset(cif.reset),.d(cif.d),.q_out(cif.q_out));
initial begin
	cif.clk='0;
	uvm_config_db#(virtual df_intf)::set(null,"*","vif",cif);
	run_test("test");
end

always #10 cif.clk = ~cif.clk;

endmodule
