
class d_scoreboard extends uvm_scoreboard;
	`uvm_component_utils(d_scoreboard)

	df_data scx_data;
	uvm_analysis_export#(df_data) df_scport;
	
	
	function new(string name = " d_scoreboard", uvm_component parent );
		super.new(name,parent);
		df_scport=new("df_scport",this);
	endfunction 
	
	 function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		scx_data=df_data::type_id::create("scx_data");
	endfunction 
	
	function void write_dat (input df_data t);
		
	`uvm_info (get_type_name (),"data to monitor PASS  ",UVM_NONE)
	 t.print();
		
	if(t.reset) 
		
		`uvm_info (get_type_name ()," RESET ACTiVE   ",UVM_NONE)
		
	else if ((t.d == t.q_out  && !t.reset ))
		
		`uvm_info (get_type_name ()," TEST PASS   ",UVM_NONE)
		
	else 
		
		`uvm_info (get_type_name ()," TEST FAiL    ",UVM_HIGH)
	
	
	endfunction 
	
endclass 
