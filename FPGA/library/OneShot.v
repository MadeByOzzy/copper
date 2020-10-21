/*
	MadeBy Ozzy
	Video for this module:
	https://www.youtube.com/watch?v=-lEdbpZraKc

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
