/*******************************************************
			  main.h
		     Ed Gehringer 2014
		       efg@ncsu.edu
********************************************************/
#define NUM_PROCESSORS 4
int sharers(ulong addr); // calculate # of lines sharing block at addr
void sendInv(ulong, int);
void sendInt(ulong, int);

