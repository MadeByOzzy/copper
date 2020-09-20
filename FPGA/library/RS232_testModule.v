
module RS232_testModule(rx, tx, rxLEDout, txButtonIn, txLEDout);

// define I/O
input rx, txButtonIn;
output tx, rxLEDout, txLEDout;

// assign rx
assign rxLEDout = rx;

// assign tx
assign tx = txButtonIn;
assign txLEDout = txButtonIn;

endmodule
