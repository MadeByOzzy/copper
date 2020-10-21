/*
	MadeBy Ozzy
	Video for this module:
	https://www.youtube.com/watch?v=aDLZvKg5tpo

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


module ReceiveBuffer_revA(clk, rst, dataDone, dataIn, bufferOut);

// define I/O
input clk, rst, dataDone;
input [7:0] dataIn;
output reg [23:0] bufferOut;


// local stuff
localparam maxBytes = 3;

reg [1:0] activeByte;
reg [7:0] byteArray [0:maxBytes-1];
wire oneShotDataDone;


// logic
always @(posedge clk)
begin
	if (!rst)
	begin
		activeByte <= 0;
	end // if !rst
	
	else
	begin
		if (oneShotDataDone)
		begin
			activeByte <= activeByte + 1;
			byteArray[activeByte] <= dataIn;
		end
		
		else
		begin
			if (activeByte == 3)
			begin
				activeByte <= 0;
			end
		end
	end
end // always



// map byteArray back to output buffer
genvar i;
generate

for (i = 0; i < maxBytes; i = i + 1)
begin: mapBytes
	localparam bufferStart = maxBytes*8 - 1 - i*8;
	
	always @(posedge clk)
	begin
		if (!rst)
		begin
			bufferOut[bufferStart -: 8] <= 0;
		end // if !rst
		
		else
		begin
			bufferOut[bufferStart -: 8] <= byteArray[i];
		end
	end // always
	
end // for mapBytes

endgenerate


// one shot filter dataDone input
OneShot oneShotInstance(
	.clk(clk),
	.rst(rst),
	.signalIn(dataDone),
	.signalOut(oneShotDataDone)
);



endmodule
