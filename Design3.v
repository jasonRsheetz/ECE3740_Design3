module Design3(output reg [3:0] AVE, input ADD, CLK, input [3:0] NUM);
reg [31:0] total = 32'b0;
integer recieved = 0;

//recieve the new number on the falling edge of the clock
always @(negedge CLK)begin

if(ADD == 1'b1)begin
	if(recieved < 8)begin
	
	total = total + NUM;
	recieved = recieved + 1;
	//end if
	end
	
	 else if(recieved == 8)begin
	
	AVE = total/8;
	recieved = 0;
	//end if
	end

//end if
end

if(ADD == 1'b0)begin
	
	AVE = total/8;
	recieved = 0;
	
	//end if
	end
	
//end always
end

endmodule

