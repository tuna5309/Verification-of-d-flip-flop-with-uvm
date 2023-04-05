module dff(
	
	input logic clk,reset,
	input logic d,
	output logic q_out
	
	);

always_ff  @(posedge clk) begin 
	
	if(reset)
		
		q_out <= '0;
	else 
		
		q_out <= d;

end 

endmodule 
