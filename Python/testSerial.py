import serial

ser = serial.Serial('COM3', 115200)  # open serial port
print(ser.name)         # check which port was really used
ser.write(b'k')     # write a string
ser.close()             # close port
