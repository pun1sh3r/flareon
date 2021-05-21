from pprint import pprint
import socket
import binascii
import struct
import binascii
hex_bytes = "795ab8bcecd3dfdd99a5b6ac1536858d090877524d71547da7a70816fdd7"

decoded_key = ''
count = 0
with open('ips.txt','r') as fh:
    lines = fh.readlines()
    for i in range(0,len(hex_bytes),4):
        for l in lines:
            l = l.split('.')
            forth_octet = l[3].rstrip()
            l[3] = l[3].rstrip()
            and_op = int(forth_octet) & 1
            if and_op == 0:
                ip = '.'.join(l)
                third_octet = l[2].rstrip()
                and_op_2 = int(third_octet) & 0x0f
                if and_op_2 == count :
                    second_octet = int(l[1].rstrip())
                    bytes = hex_bytes[i:i + 4]
                    octet= hex(second_octet)
                    b1 = chr(int(bytes[0:2],16) ^ second_octet)
                    b2 = chr(int(bytes[2:4],16) ^ second_octet)
                    decoded_key +=b1
                    decoded_key +=b2
                    count +=1
                    break
decoded_key += "@flare-on.com"
print(decoded_key)
