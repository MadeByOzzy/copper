
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
