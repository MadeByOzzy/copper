import hashlib
import codecs
import struct
import time
import requests
import json

message = "https://twitter.com/coolshoeshine2"
bits = 0x1f0000f0

# calculate difficulty from bits
exponent = bits >> 24
mantissa = bits & 0x00FFFFFF
diff = mantissa << (8 * (exponent - 3))
diffInBytes = diff.to_bytes(32, 'big')

API_URL = "https://www.madebyozzy.com/powchain-api/"
response = requests.get(API_URL)
json_string = response.text

block = json.loads(json_string)

# get data from last block
height = block['height'] + 1
prev_hash = block['hash']



# loop through all nonces to find one below difficulty
nonce = 0
startTime = time.time()
while nonce <= 0xFFFFFFFF:
    # construct new header
    header = (struct.pack("<L", height) +
              codecs.decode(prev_hash, "hex")[::-1] +
              codecs.encode(message) +
              struct.pack("<L", nonce))

    # hash twice
    digest = hashlib.sha256(header).digest()
    reversedDigest = hashlib.sha256(digest).digest()[::-1]

    # loop timing and printout
    if ((nonce % 10000) == 0) & (nonce > 0):
        currTime = time.time()
        timeDiff = currTime - startTime
        hashesPerSecond = nonce / timeDiff
        print('nonce: %d \t hashesPerSec: %f' % (nonce, hashesPerSecond))

    # check if digest is below difficulty
    if (reversedDigest < diffInBytes):
        print(nonce)
        print('Success!')

        payload = {
            "nonce": nonce,
            "message": message,
        }

        response = requests.post(API_URL, data=payload)
        print(response.text)

        currTime = time.time()
        timeDiff = currTime - startTime
        print("elapsed time (seconds):", timeDiff)
        break

    # increment nonce
    nonce += 1



