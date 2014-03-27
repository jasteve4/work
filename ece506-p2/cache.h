/*******************************************************
			  cache.h
		 Ahmad Samih & Yan Solihin
			   2009
		     Ed Gehringer 2014
	      {aasamih,solihin}@ece.ncsu.edu
		       efg@ncsu.edu
********************************************************/


#ifndef CACHE_H
#define CACHE_H

#include <cmath>
#include <iostream>

typedef unsigned long ulong;
typedef unsigned char uchar;
typedef unsigned int uint;

/****add new states, based on the protocol****/
enum cache_state {
	empty,
	I, // invalid
	E, // exclusive
	M, // modified
	Sc, // shared clean
	Sm, // shared modified
	V, // valid exclusive
	S, // shared
	D, // dirty
};

enum cache_type {msi, msi_w, dragon, firefly, };

enum bus_op_t {
  none, busRd, busRdX, busUpd, busUpgr,  
};

class cacheLine 
{
protected:
   ulong tag;
   cache_state State;   
   ulong seq; 
 
public:
   cacheLine()			{ tag = 0; State = empty; }
   ulong get_tag()       	{ return tag; }
   cache_state get_state()	{ return State;}
   ulong get_seq()       	{ return seq; }
   void set_seq(ulong Seq)	{ seq = Seq;}
   void set_state(cache_state state)	{ State = state;}
   void set_tag(ulong a)		{ tag = a; }
   //void invalidate()		{ tag = 0; State = I; }
   bool valid()         { return ((State) != empty); }
   
};

class Cache {
protected:
  ulong size, lineSize, assoc;
  ulong sets, log2Sets, log2Blk, tagMask, numLines, num_processors;
  ulong reads, readMisses, writes, writeMisses, writeBacks;
  ulong memoryTransactions, cache2cache;
  ulong busRds, busRdXs, busUpgrs, busUpds;

  cacheLine **cache;
  ulong tagField(ulong addr)	{ return (addr >> (log2Blk) );}
  ulong indexField(ulong addr)	{ return ((addr >> log2Blk) & tagMask);}
  ulong calcAddr4Tag(ulong tag) { return (tag << (log2Blk));}

public:
    ulong currentCycle;  
     
    Cache(int, int, int, int);
    virtual ~Cache() { delete cache;}

    cacheLine * findLineToReplace(ulong addr);
    virtual cacheLine * allocateLine(ulong) = 0;
    cacheLine * findLine(ulong addr);
    cacheLine * getLRU(ulong);

    ulong getRM(){return readMisses;} ulong getWM(){return writeMisses;} 
    ulong getReads(){return reads;}   ulong getWrites(){return writes;}
    ulong getBusReads(){return busRds;}   ulong getBusUpgrs(){return busUpgrs;}
    ulong getBusReadXs(){return busRdXs;}   ulong getBusUpds(){return busUpds;}
    ulong getWB(){return writeBacks;}
    ulong getmemTrans() {return memoryTransactions;}
    ulong getcache2cache() {return cache2cache;}

    void writeBack(ulong)   {writeBacks++;}
    void printStats(int);
    void updateLRU(cacheLine *);

    virtual bus_op_t PrRd(ulong, int) = 0;
    virtual bus_op_t PrWr(ulong, int) = 0;

    virtual int BusRd(ulong) = 0;
    virtual int BusRdX(ulong) = 0;
    virtual int BusUpgr(ulong) = 0;
};

#endif
