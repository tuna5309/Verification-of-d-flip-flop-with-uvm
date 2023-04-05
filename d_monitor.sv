class d_monitor extends uvm_monitor; 
	`uvm_component_utils(d_monitor)
	
	df_data df_dx;
	virtual df_intf vif;
	uvm_analysis_port#(df_data) df_monport;
	
	
	function new (string name = "d_monitor",uvm_component parent);		
		super.new(name,parent);
		df_monport=new("df_monport",this);
		
	endfunction 
	
	virtual function void build_phase (uvm_phase phase );
		super.build_phase(phase);
		df_dx=df_data::type_id::create("df_dx",this);
		if(!(uvm_config_db#(virtual df_intf)::get(this,"","vif",vif))) begin 
		`uvm_fatal("monitor ","unable to get interface ")
		end 
	endfunction 

	task mon();
		forever begin 
			
			repeat (5) begin
           @(posedge vif.clk);
			end
 			
 		df_dx.reset=vif.reset;
		df_dx.d=vif.d;
		df_monport.write(df_dx);
		end 
	endtask 


 virtual task run_phase (uvm_phase phase);
	 mon();
 endtask 
 
 
 
 endclass 
	
	
