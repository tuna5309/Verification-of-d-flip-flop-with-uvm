class test extends uvm_test;
	`uvm_component_utils(test)

	d_env env;
	d_sequence seq_test;
	

function new(string name = "test",uvm_component parent);
	super.new(name,parent);
endfunction 


function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	env=d_env::type_id::create("env",this);
endfunction 

task run_phase(uvm_phase phase);
	phase.raise_objection(this);
	`uvm_info (get_type_name ()," TEST START ",UVM_NONE)
	seq_test=d_sequence::type_id::create("seq_test",this);
	seq_test.start(env.agent.sequencer);
	phase.drop_objection(this);

endtask 


function void report_phase(uvm_phase phase);
   		uvm_report_server crc;
   		super.report_phase(phase);
    		crc = uvm_report_server::get_server();
   //`uvm_info(get_type_name(), "----------TEST PASS------------------", UVM_NONE)
 
	if(crc.get_severity_count(UVM_FATAL)+crc.get_severity_count(UVM_ERROR)>0) 
		begin
     			`uvm_info(get_type_name(), "---------------------------------------", UVM_NONE)
     			`uvm_info(get_type_name(), "----            TEST FAIL          ----", UVM_NONE)
     			`uvm_info(get_type_name(), "---------------------------------------", UVM_NONE)
    		end
    	else 
		begin
     			`uvm_info(get_type_name(), "---------------------------------------", UVM_NONE)
     			`uvm_info(get_type_name(), "----           TEST PASS           ----", UVM_NONE)
     			`uvm_info(get_type_name(), "---------------------------------------", UVM_NONE)
    		end
endfunction 



endclass 
