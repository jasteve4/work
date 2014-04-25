from os import system
import sys

system("make")

cache_size = ["32768", "65536", "131072", "262144", "524288"]
protocal = ["0", "1", "2", "3"]
for pro in protocal: 
  for size in cache_size:
    system("./dsm_cache " + size + " 8 64  canneal.04t.longTrace")
block_size = ["64", "128","256"]

for size in block_size:
  system("./dsm_cache 1048576 8 "+ size  +" canneal.04t.longTrace")

system("make clean")
