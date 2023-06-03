class agent extends component_base;
	sequencer sequ;
	driver drv;
	monitor mon;
	function new(string name, component_base parent);
		sequ=new("Sequencer",this);
		drv=new("Driver",this);
		mon=new("Monitor",this);
		drv.seq=sequ;
	endfunction
endclass

