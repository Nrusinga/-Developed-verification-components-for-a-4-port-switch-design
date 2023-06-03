class monitor extends component_base;
	virtual interface port_if pif;
	packet pack;
	function new (string name, component_base parent);
		    super.new(name,parent);
		  endfunction
	function void run();
	   forever begin
			pif.collect_data(pack);
			$display("%s",pack.print(DEC));
		    	$display("@ %s",pathname());
	   end
endclass
