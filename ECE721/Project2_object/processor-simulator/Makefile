CC = g++
#OPT = -O3
OPT = -g

INC = -I. -I../functional-simulator -I./BP -I./CACHE -I./UTILS 
LIB = -L../functional-simulator -L./BP -L./CACHE -L./UTILS 

SIM_LINUX = -DSIM_LINUX
ENDIAN = -DBYTES_LITTLE_ENDIAN -DWORDS_LITTLE_ENDIAN

#WARN = -Wall
CFLAGS = $(OPT) $(WARN) $(INC) $(LIB) $(SIM_LINUX) $(ENDIAN)

SRC = processor.cc \
      renamer.cc \
      fetch.cc decode.cc rename.cc dispatch.cc schedule.cc register_read.cc execute.cc writeback.cc retire.cc \
      alu.cc lsu.cc squash.cc checker.cc \
      fetch_queue.cc issue_queue.cc lane.cc pipeline_register.cc payload.cc \
      simulator.cc parameters.cc globals.cc sim_input.cc sim_output.cc

OBJ = processor.o \
      renamer.o \
      fetch.o decode.o rename.o dispatch.o schedule.o register_read.o execute.o writeback.o retire.o \
      alu.o lsu.o squash.o checker.o \
      fetch_queue.o issue_queue.o lane.o pipeline_register.o payload.o \
      simulator.o parameters.o globals.o sim_input.o sim_output.o


all: $(OBJ)
	$(CC) -o 721sim $(CFLAGS) \
		$(OBJ) -lFUNCSIM -lBP -lCACHE -lUTILS

.cc.o:
	$(CC) $(CFLAGS) -c $*.cc


clean:
	rm -f *.o 721sim

clobber:
	rm -f *.o
