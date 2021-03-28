/*
	MadeBy Ozzy
	Video for this module:
	https://www.youtube.com/watch?v=Jybtw669DbQ

	Support:
    Bitcoin
    1P4kBPyFoR6xa4sy2hnHL3oY6sg4PrXn6M
    Digibyte
    DMgbQqZ9Vr7KrCxd7LrPJE5kWYHZX7DTTW
    Monero
    46NQaqW3ZNvUt3DCSxLLLyHpaVMSbwLqS3tHmhVLrafXU3K2crb12qK4PfN7kaHkaLcSTs9cCX1NMPsaCnSMhkRACWzxmax

	Contact:
	madebyozzy@gmail.com
*/


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
