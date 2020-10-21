/*
	MadeBy Ozzy
	Video for this module:
	https://www.youtube.com/watch?v=Jybtw669DbQ

	Support:
	Digibyte
	DMgbQqZ9Vr7KrCxd7LrPJE5kWYHZX7DTTW
	Bitcoin
	1P4kBPyFoR6xa4sy2hnHL3oY6sg4PrXn6M
	Litecoin
	Lc98RWgNJpkYxoEPWux7apP2jA3iu2LMWh
	Ethereum
	0xF57a1Fe0E004E4Ac8572e3ba3F4f697823C4e04C

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
