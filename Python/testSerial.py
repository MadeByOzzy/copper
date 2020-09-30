import serial

# open serial port
ser = serial.Serial('COM3', 115200)

# flush all read contents
ser.flush()

# write a string
ser.write(b'K')

# read back mirrored response
response = ser.read()
print(response)

# close port
ser.close()
