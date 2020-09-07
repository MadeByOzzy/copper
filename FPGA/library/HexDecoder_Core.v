
// takes 4 bit input dataIn
// returns hexadecimal char bits for 7 segment display out
module HexDecoder_Core(clk, rst, dataIn, dispOut);

input clk, rst;
input [3:0] dataIn;
output reg [6:0] dispOut;


always @(posedge clk)
begin

	if (!rst) begin
		dispOut[6:0] <= 7'b1111111;
	end // if !rst
	
	else begin
		case (dataIn)
			4'H0:
			begin
				dispOut[6:0] <= 7'b1000000;
			end // 0
			
			4'H1:
			begin
				dispOut[6:0] <= 7'b1111001;
			end // 1
			
			4'H2:
			begin
				dispOut[6:0] <= 7'b0100100;
			end // 2
			
			4'H3:
			begin
				dispOut[6:0] <= 7'b0110000;
			end // 3
			
			4'H4:
			begin
				dispOut[6:0] <= 7'b0011001;
			end // 4
			
			4'H5:
			begin
				dispOut[6:0] <= 7'b0010010;
			end // 5
			
			4'H6:
			begin
				dispOut[6:0] <= 7'b0000010;
			end // 6
			
			4'H7:
			begin
				dispOut[6:0] <= 7'b1111000;
			end // 7
			
			4'H8:
			begin
				dispOut[6:0] <= 7'b0000000;
			end // 8
			
			4'H9:
			begin
				dispOut[6:0] <= 7'b0011000;
			end // 9
			
			4'HA:
			begin
				dispOut[6:0] <= 7'b0001000;
			end // A
			
			4'HB:
			begin
				dispOut[6:0] <= 7'b0000011;
			end // B
			
			4'HC:
			begin
				dispOut[6:0] <= 7'b0100111;
			end // C
			
			4'HD:
			begin
				dispOut[6:0] <= 7'b0100001;
			end // D
			
			4'HE:
			begin
				dispOut[6:0] <= 7'b0000110;
			end // E
			
			4'HF:
			begin
				dispOut[6:0] <= 7'b0001110;
			end // F
			
		endcase
	end

end


endmodule
