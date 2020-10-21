/*
	MadeBy Ozzy
	Video for this module:
	https://www.youtube.com/watch?v=78k54Nm7dpE

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

module General42bitCounter(clk, rst, counter);

input clk, rst;
output reg [41:0] counter;


always @(posedge clk)
begin

	if (!rst) begin
		counter <= 0;
	end // if rst
	
	else begin
		counter <= counter + 1;
	end // else

end // always

endmodule
