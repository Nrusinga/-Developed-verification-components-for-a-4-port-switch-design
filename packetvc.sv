class packetvc extends component_base;
	agent agn;
	function new(string name, component_base parent);
		agn=new("Agent",this);
		super(name,parent);
	endfunction
	function void run(int runs);
		agn.drv.run(runs);
	    fork
		agn.mon.run();
	    join_none
	function void configure(virtual interface port_if pif, int portno);
		agn.drv.pif=pif;
		agn.mon.pif=pif;
		agn.sequ.portno=portno;
	endfunction
endclass
