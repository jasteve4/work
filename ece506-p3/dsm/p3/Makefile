CC = g++
OPT = -O3
OPT = -g
WARN = -Wall
ERR = -Werror

CFLAGS = $(OPT) $(WARN) $(ERR) $(INC) $(LIB)

SIM_SRC = main.cc cache.cc mesi.cc

SIM_OBJ = main.o cache.o mesi.o

all: dsm_cache
	@echo "Compilation Done ---> nothing else to make :) "

dsm_cache: $(SIM_OBJ)
	$(CC) -o dsm_cache $(CFLAGS) $(SIM_OBJ) -lm
	@echo "----------------------------------------------------------"
	@echo "---------SPR 2014: 506 DSM SIMULATOR (DSM_CACHE)----------"
	@echo "----------------------------------------------------------"
 
.cc.o:
	$(CC) $(CFLAGS)  -c $*.cc

clean:
	rm -f *.o dsm_cache

clobber:
	rm -f *.o


