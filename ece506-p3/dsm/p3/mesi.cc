/*******************************************************
			 dragon.cc
		       Ed Gehringer
		    efg@ncsu.edu, 2014
********************************************************/
		     
#include <stdlib.h>
#include <assert.h>
#include <stdio.h>
#include "main.h"
#include "cache.h"
#include "mesi.h"
using namespace std;

void MESI::PrRd(ulong addr, int processorNumber) 
{
    currentCycle++; /* Per-cache global counter to maintain LRU order 
	    among cache ways, updated on every cache access */
    reads++;
    cacheLine * line = findLine(addr);
    if (line == NULL) { // This is a miss
	readMisses++;
	cacheLine *newline = allocateLine(addr);
	//int shared_line = sharers(addr) > 0; // newline is also a sharer, but
	// won't show up in count till we set its state
	newline->set_state(S); 
        memoryTransactions++;
        //busRds++;
    }
    else 
    { // This is a hit
	updateLRU(line);
    }
}

void MESI::PrWr(ulong addr, int processorNumber) 
{
    cache_state state;
    currentCycle++;
    writes++;
    cacheLine * line = findLine(addr);
    if (line == NULL) 
    { /* This is a miss */
	writeMisses++;
	cacheLine *newline = allocateLine(addr);
        memoryTransactions++;
        newline->set_state(M); 
       // busRdXs++;
    }
    else 
    {
	/** Since it's a hit, update LRU and update state **/
	updateLRU(line);
	state=line->get_state();
	if (state==M) 
        {
	    line->set_state(M);
	}
	else
        { 
	    line->set_state(M);
            //busRdXs++;
	}
    }
}


cacheLine * MESI::allocateLine(ulong addr) { 
    ulong tag;
    cache_state state;
   
    cacheLine *victim = findLineToReplace(addr);
    assert(victim != 0);
    state = victim->get_state();
    if (state==M) {
        writeBack(addr);
        memoryTransactions++;
    }
	
    tag = tagField(addr);   
    victim->set_tag(tag);
    victim->set_state(empty);	 
   /** Note that this cache line has already been upgraded to MRU
     in the previous function (findLineToReplace)**/

    return victim;
}

  void MESI::signalRd(ulong, int) {}
  void MESI::signalRdX(ulong, int) {}
  void MESI::signalUpgr(ulong, int) {}
  void MESI::Int(ulong) {}
  void MESI::Inv(ulong) {}
  void MESI::notifyCtrl(ulong){}
