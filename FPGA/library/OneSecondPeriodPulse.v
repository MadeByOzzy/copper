/*
	MadeBy Ozzy
	Video for this module:
	https://www.youtube.com/watch?v=GOzY5iPTYXA

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


module OneSecondPeriodPulse(clk, rst, out);

input clk;
input rst;
output reg out;

// 25 bit integer to count up to 25 million
// 25 million with 50MHz clock = 0.5 seconds
reg [24:0] count;


always @(posedge clk)
begin

	if (!rst) begin
		count <= 0;
		out <= 0;
	end // if rst
	
	else begin
	
		// 25'd25000000
		if (count > 25000000) begin
			out <= !out;
			count <= 0;
		end // count
		
		else begin
			count <= count + 1;
		end // else count
	
	end // else rst
	

end // always


endmodule
