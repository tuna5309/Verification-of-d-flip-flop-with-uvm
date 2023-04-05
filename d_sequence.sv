
class d_sequence extends uvm_sequence#(df_data);
	`uvm_object_utils(d_sequence)
	
	df_data df_d;
	
	
	function new(string name = "d_sequence");
		super.new(name);
	endfunction 
	
	task body();
		df_d=df_data::type_id::create("df_d");
		repeat(20)
			begin
		start_item(df_d);
		if(!(df_d.randomize()))
			begin
				`uvm_error(get_type_name(),"block can't randomize df_data")
			end 
		df_d.print();
		finish_item(df_d);
			end
	endtask 
endclass 


