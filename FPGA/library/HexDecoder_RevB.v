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

module HexDecoder_RevB(clk, rst,
	hexIn0, hexIn1, hexIn2, hexIn3, hexIn4, hexIn5,
	disp0, disp1, disp2, disp3, disp4, disp5);
	
input clk, rst;
input [3:0] hexIn0, hexIn1, hexIn2, hexIn3, hexIn4, hexIn5;
output [6:0] disp0, disp1, disp2, disp3, disp4, disp5;

HexDecoder_Core inst0(
	.clk(clk),
	.rst(rst),
	.dataIn(hexIn0),
	.dispOut(disp0));
	
HexDecoder_Core inst1(
	.clk(clk),
	.rst(rst),
	.dataIn(hexIn1),
	.dispOut(disp1));
	
HexDecoder_Core inst2(
	.clk(clk),
	.rst(rst),
	.dataIn(hexIn2),
	.dispOut(disp2));
	
HexDecoder_Core inst3(
	.clk(clk),
	.rst(rst),
	.dataIn(hexIn3),
	.dispOut(disp3));
	
HexDecoder_Core inst4(
	.clk(clk),
	.rst(rst),
	.dataIn(hexIn4),
	.dispOut(disp4));
	
HexDecoder_Core inst5(
	.clk(clk),
	.rst(rst),
	.dataIn(hexIn5),
	.dispOut(disp5));
	
endmodule
