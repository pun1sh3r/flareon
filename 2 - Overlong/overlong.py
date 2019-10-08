import binascii

hex_bytes = "e08189c0a0c1aee081a5c1b6f08081a5e081b2f08080a0e081a2726fc1ab65e080a0e081b4e081a8c1a520c1a5e081ae63c1afe081a4f08081a96ec1a7c0ba2049f080819fc1a1c19fc18de0819fc1b4f080819ff08081a8c19ff08081a5e0819fc1a5e0819ff08081aec19ff0808183c19fe081afe0819fc1845fe081a9f080819f6ee0819fe081a7e08180f08081a6f08081ace081a1c1b2c1a5f08080adf08081af6ec0aef08081a36ff08081ad"
hex_bytes = binascii.unhexlify(hex_bytes)
byte_str = ''

for b in range(0,len(hex_bytes),1):
    if hex_bytes[b] >> 3 == int('1e', 16):
        byte_str +=chr((hex_bytes[b + 2 ] & 0x3F) << 6 | (hex_bytes[b + 3 ] & 0x3F))
    if hex_bytes[b] >> 4 == int('0E', 16):
        byte_str += chr((hex_bytes[b + 2 ] & 0x3f) | (hex_bytes[b + 1 ] & 0x3f) << 6)
    if hex_bytes[b] >> 5 == int('06', 16):
        byte_str += chr((hex_bytes[b + 1] & 0x3f) | (hex_bytes[b] & 0x1F) << 6   )
    else:
        if chr(hex_bytes[b]).isascii():
            byte_str += chr(hex_bytes[b])

print(byte_str)