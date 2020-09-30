
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
