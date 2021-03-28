/*
	MadeBy Ozzy
	Video for this module:
	https://www.youtube.com/watch?v=-lEdbpZraKc

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


module OneShot(clk, rst, signalIn, signalOut);

// define IO
input clk, rst, signalIn;
output signalOut;


// local stuff
reg laggedSignal;


assign signalOut = signalIn & !laggedSignal;


// logic
always @(posedge clk)
begin
	if (!rst)
	begin
		laggedSignal <= 0;
	end // if !rst
	
	else
	begin
		laggedSignal <= signalIn;
	end // if rst
end // always


endmodule
