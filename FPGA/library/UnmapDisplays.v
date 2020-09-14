
module UnmapDisplays(vectorIn, disp0, disp1, disp2, disp3, disp4, disp5);


input [41:0] vectorIn;
output [6:0] disp0, disp1, disp2, disp3, disp4, disp5;


localparam busWidth = 7;

assign disp0[6:0] = vectorIn[41-busWidth*0 -: busWidth];
assign disp1[6:0] = vectorIn[41-busWidth*1 -: busWidth];
assign disp2[6:0] = vectorIn[41-busWidth*2 -: busWidth];
assign disp3[6:0] = vectorIn[41-busWidth*3 -: busWidth];
assign disp4[6:0] = vectorIn[41-busWidth*4 -: busWidth];
assign disp5[6:0] = vectorIn[41-busWidth*5 -: busWidth];


endmodule
