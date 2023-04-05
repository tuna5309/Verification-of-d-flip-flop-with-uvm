class df_data extends uvm_sequence_item;
	
		
		rand bit d;
		rand bit reset;
		bit  q_out;
	
	
	
	
	`uvm_object_utils_begin(df_data)
		`uvm_field_int(reset,UVM_ALL_ON)
		`uvm_field_int(d,UVM_ALL_ON)
		`uvm_field_int(q_out,UVM_ALL_ON)
	`uvm_object_utils_end
	

		function new (string name ="df_data");
			super.new(name);
		endfunction 
endclass 
