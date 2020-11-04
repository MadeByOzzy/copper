import hashlib
import codecs
import struct
import time

#######################################################################################
# Sample block header
# https://chainz.cryptoid.info/dgb/block.dws?00000000000000021e26fd20b71b9738568f2d8c7ab0324a6da300b49324cfba.htm
version = 545260034
prevHash = '8da53e5382400f22a95961830957abcc06823d2800149953d9b63d2ec3751862'
merkleRoot = 'f5f44808d0a7a020bcb2fe3811452abcc8c8ad28afab47b50e509cca8424233a'
t = 1604459159
bits = 0x190309f7
nonce = 316261512


header = (struct.pack("<L", version) +
            codecs.decode(prevHash, "hex")[::-1] +
            codecs.decode(merkleRoot, "hex")[::-1] +
            struct.pack("<L", t) +
            struct.pack("<L", bits) +
            struct.pack("<L", nonce) )

digest = hashlib.sha256(header).digest()
hexDigest = hashlib.sha256(digest).hexdigest()
print(hexDigest)

reversedDigest = hashlib.sha256(digest).digest()[::-1]
print(codecs.encode(reversedDigest, 'hex'))



#######################################################################################
# calculate difficulty from bits
exponent = bits >> 24
mantissa = bits & 0x00FFFFFF
diff = mantissa << (8 * (exponent - 3))
print(reversedDigest < diff.to_bytes(32, 'big'))
diffInBytes = diff.to_bytes(32, 'big')


#######################################################################################
# loop through all nonces to find one below difficulty
nonce = 306261512
startTime = time.time()
while nonce <= 0xFFFFFFFF:
    # construct new header
    header = (struct.pack("<L", version) +
              codecs.decode(prevHash, "hex")[::-1] +
              codecs.decode(merkleRoot, "hex")[::-1] +
              struct.pack("<L", t) +
              struct.pack("<L", bits) +
              struct.pack("<L", nonce))

    # hash twice
    digest = hashlib.sha256(header).digest()
    reversedDigest = hashlib.sha256(digest).digest()[::-1]

    # loop timing and printout
    if ((nonce % 100) == 0) & (nonce > 0):
        currTime = time.time()
        timeDiff = currTime - startTime
        hashesPerSecond = nonce / timeDiff
        print('nonce: %d \t hashesPerSec: %f' % (nonce, hashesPerSecond))

    # check if digest is below difficulty
    if (reversedDigest < diffInBytes):
        print(nonce)
        print('Success!')
        break

    # increment nonce
    nonce += 1
