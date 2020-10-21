/*
	MadeBy Ozzy
	Video for this module:
	https://www.youtube.com/watch?v=Jybtw669DbQ

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
