class driver extends component_base;
	virtual interface port_if pif;
	packet pack;
	
	function new (string name, component_base parent);
		    super.new(name,parent);
		  endfunction
	function void run(int runs);
	   repeat(runs) begin
		sequencer seq;
		seq.get_next_item(pack);
		$display("%s",pack.print(DEC));
		pif.drive_packet(pack);
		$display("@ %s",pathname());
		$display("@ %s",seq.pathname());
	   end
	endfunction: pathname
endclass
		
	
