import hashlib
import codecs

message = codecs.encode("1")
hashObject = hashlib.sha256(message)
hexdigest = hashObject.hexdigest()
print(hexdigest)
