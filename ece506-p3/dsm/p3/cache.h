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

enum dir_state {
  U, // unowned
  EM, // exclusive-modified
  S_, // shared
};

class dirEntry {
  public:
    ulong tag;
    uchar state;
    bool bit[4];

    dirEntry() {
	tag = 0; state = U;
	for (int i = 0; i < 4; i++)
	    bit[i] = false;
    }

};

class Directory {
  public:
    ulong size;
    dirEntry *entry;

    Directory(ulong numEntries) {
	size = numEntries;
	entry = new dirEntry[size];
    }

    dirEntry* findUncached(ulong dir_tag);
    dirEntry* findEntry(ulong);
    int Access(ulong);
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
   void invalidate()		{ tag = 0; State = I;}
   bool valid()  { return ((State != empty) && (State != I)); }
     // Was: { return ((State) != empty); , but that's a bug.}
   
};

class Cache {
protected:
  ulong size, lineSize, assoc;
  ulong sets, log2Sets, log2Blk, tagMask, numLines, num_processors;
  ulong reads, readMisses, writes, writeMisses, writeBacks;
  ulong invalidations, interventions;
  ulong memoryTransactions, cache2cache;
  int cache_num;
  Directory * directory;

  cacheLine **cache;
  ulong tagField(ulong addr)	{ return (addr >> (log2Blk) );}
  ulong indexField(ulong addr)	{ return ((addr >> log2Blk) & tagMask);}
  ulong calcAddr4Tag(ulong tag) { return (tag << (log2Blk));}

public:
    ulong currentCycle;  
     
    Cache(int, int, int, int);
    virtual ~Cache() { delete cache;}

    cacheLine * findLineToReplace(ulong addr);
    virtual cacheLine * allocateLine(ulong, int) = 0;
    virtual void notifyCtrl(ulong) = 0;
    cacheLine * findLine(ulong addr);
    cacheLine * getLRU(ulong);

    ulong getRM(){return readMisses;} ulong getWM(){return writeMisses;} 
    ulong getReads(){return reads;}   ulong getWrites(){return writes;}
    ulong getWB(){return writeBacks;}
    ulong getmemTrans() {return memoryTransactions;}
    ulong getcache2cache() {return cache2cache;}
    ulong getInt() { return interventions; }
    ulong getInv() { return invalidations; }
	
    void writeBack(ulong)   {writeBacks++;}
    void printStats(int);
    void updateLRU(cacheLine *);
    void setDirectory (Directory *dir) {directory = dir;}

    virtual void PrRd(ulong, int) = 0;
    virtual void PrWr(ulong, int) = 0;

    virtual void signalRd(ulong, int) = 0;
    virtual void signalRdX(ulong, int) = 0;
    virtual void signalUpgr(ulong, int) = 0;
    virtual void Int(ulong) = 0;
    virtual void Inv(ulong) = 0;
};

#endif
