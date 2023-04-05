class d_agent extends uvm_agent;
	`uvm_component_utils(d_agent)
	
d_driver driver;
d_monitor monitor;
d_sequencer sequencer;


function new(string name ="d_agent",uvm_component parent);
	super.new(name,parent);
endfunction 

function void build_phase(uvm_phase phase);
	driver=d_driver::type_id::create("driver",this);
	monitor=d_monitor::type_id::create("monitor",this);
	sequencer=d_sequencer::type_id::create("sequencer",this);
endfunction 

function void  connect_phase (uvm_phase phase);
	super.connect_phase(phase);
	driver.seq_item_port.connect(sequencer.seq_item_export);
endfunction 

endclass
