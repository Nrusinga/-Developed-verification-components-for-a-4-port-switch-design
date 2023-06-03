class sequencer extends component_base;
	int portno;
	function new (string name, component_base parent);
	    super.new(name,parent);
	  endfunction
	function void get_next_item(output packet pack);
		psingle psin;
		packet pack;
		randcase
		    1: pack=new("pack",portno,SINGLE);
		    1: begin
		    	    psin=new("psin",portno,SINGLE);
		            pack=psin;
		       end
		endcase
	endfunction
endclass
