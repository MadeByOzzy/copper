/*
	MadeBy Ozzy
	Video for this module:
	https://www.youtube.com/watch?v=4JruzgALCm8

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

module SevenSegmentDisplay_RevA(disp0, disp1, disp2, disp3, disp4, disp5);

output [6:0] disp0;
output [6:0] disp1;
output [6:0] disp2;
output [6:0] disp3;
output [6:0] disp4;
output [6:0] disp5;

assign disp0 = 7'b0011001; // 4
assign disp1 = 7'b0100100; // 2
assign disp2 = 7'b1000000; // 0
assign disp3 = 7'b1111111; // blank
assign disp4 = 7'b0000010; // 6
assign disp5 = 7'b0011000; // 9


endmodule
