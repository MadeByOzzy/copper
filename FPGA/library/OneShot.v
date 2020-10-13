
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
