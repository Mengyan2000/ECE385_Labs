module InvAddRoundkey(input logic [127:0] state, input logic [1407:0] roundKey,
							 input logic [3:0] count,
							 output logic [127:0] next_state);
							 
			logic [127:0] key;
			
			always_comb
			begin
					unique case(count)
							4'b1010 : key = roundKey[1407:1280];
							4'b1001 : key = roundKey[1279:1152];
							4'b1000 : key = roundKey[1151:1024];
							4'b0111 : key = roundKey[1023:896];
							4'b0110 : key = roundKey[895:768];
							4'b0101 : key = roundKey[767:640];
							4'b0100 : key = roundKey[639:512];
							4'b0011 : key = roundKey[511:384];
							4'b0010 : key = roundKey[383:256];
							4'b0001 : key = roundKey[255:128];
							4'b0000 : key = roundKey[127:0];
							default : key = 0;
					endcase
			end
			assign next_state = state ^ key;
			
endmodule