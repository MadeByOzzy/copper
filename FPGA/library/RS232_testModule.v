/*
	MadeBy Ozzy
	Video for this module:
	https://www.youtube.com/watch?v=Jybtw669DbQ

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
