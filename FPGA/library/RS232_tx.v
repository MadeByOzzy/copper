/*
	MadeBy Ozzy
	Video for this module:
	https://www.youtube.com/watch?v=QEGJZSawJ90

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


module RS232_tx(clk, rst, dataIn, tx, dataDoneFlag);

input clk, rst;
input [7:0] dataIn;
input dataDoneFlag;
output reg tx;

// states
localparam s_idle = 0;
localparam s_start = 1;
localparam s_write = 2;
localparam s_stop = 3;

// local parameters
localparam baudClockCycles = 434;

// local registers
reg [1:0] STATE;
reg [8:0] counter;
reg [2:0] activeBit;
reg [7:0] latchedData;


// logic
always @(posedge clk)
begin

	if (!rst)
	begin
		STATE <= s_idle;
		counter <= 0;
		activeBit <= 0;
		tx <= 1;
		latchedData <= 0;
	end // if !rst
	
	else
	begin
	
		case (STATE)
		
		//////////////////////////////////////////////////////////
		s_idle:
		begin
			counter <= 0;
			activeBit <= 0;
			tx <= 1;
			
			STATE <= dataDoneFlag ? s_start : s_idle;
		end
		
		//////////////////////////////////////////////////////////
		s_start:
		begin
			tx <= 0;
			latchedData <= dataIn;
			
			if (counter > baudClockCycles)
			begin
				counter <= 0;
				STATE <= s_write;
			end
			
			else
			begin
				counter <= counter + 1;
				STATE <= s_start;
			end
		end
		
		//////////////////////////////////////////////////////////
		s_write:
		begin
		
			if (counter > baudClockCycles)
			begin
				counter <= 0;
				activeBit <= activeBit + 1;
				
				if (activeBit == 7)
				begin
					STATE <= s_stop;
				end
				
				else
				begin
					STATE <= s_write;
				end
			end
			
			else
			begin
				tx <= latchedData[activeBit];
				counter <= counter + 1;
				STATE <= s_write;
			end
		
		end
		
		//////////////////////////////////////////////////////////
		s_stop:
		begin
			tx <= 1;
			
			if (counter > baudClockCycles)
			begin
				STATE <= s_idle;
			end
			
			else
			begin
				counter <= counter + 1;
				STATE <= s_stop;
			end
		end
		
		//////////////////////////////////////////////////////////
		default
		begin
			STATE <= s_idle;
		end
		
		
		endcase
	
	end

end // always

endmodule
