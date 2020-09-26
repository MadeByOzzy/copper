
module RS232_rx(clk, rst, rx, dataOut);

// input/outputs
input clk, rst, rx;
output reg [7:0] dataOut;

// states
localparam s_idle = 0;
localparam s_start = 1;
localparam s_read = 2;
localparam s_stop = 3;

// local parameters
localparam baudClockCycles = 434;
localparam baudHalf = baudClockCycles / 2;

// local registers
reg [1:0] STATE;
reg [8:0] counter;
reg [2:0] activeBit;


// logic
always @(posedge clk)
begin

	if (!rst)
	begin
		STATE <= s_idle;
		counter <= 0;
		activeBit <= 0;
		dataOut <= 0;
	end // if !rst
	
	else
	begin
		case (STATE)
		
		//////////////////////////////////////////////////////////
		s_idle:
		begin
			// what state does
			counter <= 0;
			activeBit <= 0;
			
			// state change condition
			STATE <= rx ? s_idle : s_start;
		end // s_idle:
		
		//////////////////////////////////////////////////////////
		s_start:
		begin
			if (counter > baudHalf)
			begin
				STATE <= s_read;
				counter <= 0;
			end
			
			else
			begin
				STATE <= s_start;
				counter <= counter + 1;
			end
		end // s_start
		
		//////////////////////////////////////////////////////////
		s_read:
		begin
			if (counter > baudClockCycles)
			begin
				counter <= 0;
				dataOut[activeBit] <= rx;
				activeBit <= activeBit + 1;
				
				if (activeBit == 7)
				begin
					STATE <= s_stop;
				end
				
				else
				begin
					STATE <= s_read;
				end
				
			end
			
			else
			begin
				counter <= counter + 1;
				STATE <= s_read;
			end
		end // s_read:
		
		//////////////////////////////////////////////////////////
		s_stop:
		begin
			if (counter > baudClockCycles)
			begin
				STATE <= s_idle;
				counter <= 0;
			end
			
			else
			begin
				counter <= counter + 1;
				STATE <= s_stop;
			end
		end // s_stop
		
		//////////////////////////////////////////////////////////
		default
		begin
			STATE <= s_idle;
		end
		
		endcase
	end

end // always

endmodule