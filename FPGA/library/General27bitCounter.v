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

module General27bitCounter(clk, rst, counter);

input clk, rst;
output reg [26:0] counter;


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
