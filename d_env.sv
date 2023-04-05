class d_env extends uvm_env ;
	 `uvm_component_utils(d_env)

	d_agent agent;
	d_scoreboard score;
	
 function new (string name = "d_env",uvm_component parent=null);
	 super.new(name,parent);
 endfunction 
 
 virtual function void build_phase(uvm_phase phase);
	 agent=d_agent::type_id::create("d_agent",this);
	 score=d_scoreboard::type_id::create("score",this);
 endfunction 
 
 virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
	agent.monitor.df_monport.connect(score.df_scport);
 endfunction
 
	
endclass 
