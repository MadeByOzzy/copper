/*
	MadeBy Ozzy
	Video for this module:
	https://www.youtube.com/watch?v=bR2ozkTF2yI

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

module HexDecoder_RevC(clk, rst, hexVectorIn, dispVectorOut);

// preliminary math
localparam numDisplays = 6;
localparam hexBusWidth = 4;
localparam dispBusWidth = 7;

localparam hexVecLength = numDisplays * hexBusWidth;
localparam dispVecLength = numDisplays * dispBusWidth;

// define input/outputs
input clk, rst;
//input [hexVecLength-1:0] hexVectorIn;
//output [dispVecLength-1:0] dispVectorOut;
input [23:0] hexVectorIn;
output [41:0] dispVectorOut;

// declare local wires
wire [hexBusWidth-1:0] hexArray [0:numDisplays-1];
wire [dispBusWidth-1:0] dispArray [0:numDisplays-1];


// generate instances
genvar i;
generate

	// unpack
	for (i = 0; i < numDisplays; i=i+1)
	begin : unpack
		localparam indexStart = hexVecLength - 1 - (i * hexBusWidth);
		assign hexArray[i] = hexVectorIn[indexStart -: hexBusWidth];
	end // for i : unpack

	// create instances
	for (i = 0; i < numDisplays; i=i+1)
	begin : makeCore
		HexDecoder_Core inst(
			.clk(clk),
			.rst(rst),
			.dataIn(hexArray[i]),
			.dispOut(dispArray[i]));
	end // for i : makeCore
	
	// pack
	for (i = 0; i < numDisplays; i=i+1)
	begin : pack
		localparam indexStart = dispVecLength - 1 - (i * dispBusWidth);
		assign dispVectorOut[indexStart -: dispBusWidth] = dispArray[i];
	end // for i : pack
	
endgenerate


endmodule
