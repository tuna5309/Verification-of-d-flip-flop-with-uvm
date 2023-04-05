class d_driver extends uvm_driver#(df_data);
 	
 	`uvm_component_utils(d_driver)

df_data df_d;
virtual df_intf vif;


function new (string name = "d_driver",uvm_component parent);
	super.new(name,this);
endfunction 

virtual function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	df_d=df_data::type_id::create("df_d");
	if(!(uvm_config_db#(virtual df_intf)::get(this,"","vif",vif))) begin 
		`uvm_fatal("driver ","unable to get interface ")
	end 
	
endfunction 


task drv();
	
	forever begin : t
		df_d=df_data::type_id::create("df_d");
		seq_item_port.get_next_item(df_d);
			vif.reset <= df_d.reset;
			vif.d     <= df_d.d;
			//df.print();
		seq_item_port.item_done();
		
		repeat (5) begin
           @(posedge vif.clk);
		end
	end 
endtask 


virtual task run_phase (uvm_phase phase);
drv();
endtask
endclass 



