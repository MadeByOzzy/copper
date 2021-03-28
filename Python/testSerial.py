"""
    MadeByOzzy

    Support:
    Bitcoin
    1P4kBPyFoR6xa4sy2hnHL3oY6sg4PrXn6M
    Digibyte
    DMgbQqZ9Vr7KrCxd7LrPJE5kWYHZX7DTTW
    Monero
    46NQaqW3ZNvUt3DCSxLLLyHpaVMSbwLqS3tHmhVLrafXU3K2crb12qK4PfN7kaHkaLcSTs9cCX1NMPsaCnSMhkRACWzxmax

    Contact:
    madebyozzy@gmail.com
"""

import serial

# open serial port
ser = serial.Serial('COM4', 115200)

# flush all read contents
ser.flush()

# write a string
ser.write(b'456')

# read back mirrored response
response = ser.read()
print(response)

# close port
ser.close()
