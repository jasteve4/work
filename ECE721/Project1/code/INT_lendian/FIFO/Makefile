
CC = g++
OPT = -O3
#OPT = -g

INC = -I.
LIB = -L.

CFLAGS = $(OPT) $(INC) $(LIB)

SRC = main.cc
OBJ = main.o


#################################

all: $(OBJ)
	$(CC) -o main \
		$(CFLAGS) \
		$(OBJ) \
	@echo "-----------DONE WITH make-----------"
 
.cc.o:
	$(CC) $(CFLAGS) -c $*.cc



clean:
	rm -f *.o 721sim core
clobber:
	rm -f *.o
