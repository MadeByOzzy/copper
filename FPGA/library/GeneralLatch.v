
module GeneralLatch(clk, rst, signalIn, latchedOut);

// define I/O
input clk, rst, signalIn;
output reg latchedOut;


always @(posedge clk)
begin

	if (!rst)
	begin
		latchedOut <= 0;
	end
	
	else
	begin
		if (signalIn)
		begin
			latchedOut <= 1;
		end // if signalIn
	end

end // always

endmodule
