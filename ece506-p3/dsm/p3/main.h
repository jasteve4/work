/*******************************************************
			  main.h
		     Ed Gehringer 2014
		       efg@ncsu.edu
********************************************************/
int sharers(ulong addr); // calculate # of lines sharing block at addr
void sendInv(ulong, int);
void sendInt(ulong, int);

