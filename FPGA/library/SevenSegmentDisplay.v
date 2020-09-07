
module SevenSegmentDisplay_RevA(disp0, disp1, disp2, disp3, disp4, disp5);

output [6:0] disp0;
output [6:0] disp1;
output [6:0] disp2;
output [6:0] disp3;
output [6:0] disp4;
output [6:0] disp5;

assign disp0 = 7'b0011001; // 4
assign disp1 = 7'b0100100; // 2
assign disp2 = 7'b1000000; // 0
assign disp3 = 7'b1111111; // blank
assign disp4 = 7'b0000010; // 6
assign disp5 = 7'b0011000; // 9


endmodule
