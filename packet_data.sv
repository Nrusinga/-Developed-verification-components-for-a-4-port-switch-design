

// packet class
typedef enum{HEX,BIN,DEC} pp_t;
typedef enum{ANY, SINGLE, MULTICAST, BROADCAST} p_type;
class packet;
	local string name;
	rand bit[3:0] target;
	bit[3:0] source;
	rand bit[7:0] data;
	rand p_type=ptype;

	constraint target1 {target!=0 ; target!=source ; target & source=4'b0};
	constraint ptype_type {ptype == SINGLE ->  target inside {1,2,4,8};  
                          ptype == MULTICAST ->  target inside {3,[5:7],[9:14]};  
                          ptype == BROADCAST -> target == 15;} 
	constraint ptype_order {solve ptype before target;}				
	function new(string name, int idt, ptype p);
		this.name=name;
		source=1<<i;
		ptype=p;
	endfunction
	
	function string getptype();
		return ptype.name;
	endfunction

	function string getname();
		return name;
	endfunction
		
		
	function void print(input pp_t pp = DEC);
		$dsiplay("name = %s, type = %s", getname(), getptype());
		case(pp)
			HEX:$display("source = %h, target = %h, data = %h", source,target,data);
			BIN:$display("source = %b, target = %b, data = %b", source,target,data);
			DEC:$display("source = %0d, target = %0d, data = %0d", source,target,data);
		endcase
	endfunction

  // add properties here

  // add constructor to set instance name and source by arguments and packet type

 // add print with policy
 
endclass

class psingle extends packet;
	constraint target_port{target inside {1,2,4,8};}
	function new(string name, int idt, ptype p);
		super.mew(name,idt, p);
	endfunction
endclass

class pmulticast extends packet;
	constraint target_port{target inside {3,[5:7],[9:14]};}
	function new(string name, int idt, ptype p);
		super.mew(name,idt, p);
	endfunction
endclass

class pbroadcast extends packet;
	constraint target_port{target==15}
	function new(string name, int idt, ptype p);
		super.mew(name,idt, p);
	endfunction
endclass
