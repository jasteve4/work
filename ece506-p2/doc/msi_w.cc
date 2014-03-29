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
#include "msi_w.h"
using namespace std;

bus_op_t Msi_w::PrRd(ulong addr, int processorNumber) 
{
    currentCycle++; /* Per-cache global counter to maintain LRU order 
	    among cache ways, updated on every cache access */
    reads++;
    cacheLine * line = findLine(addr);
    if (line == NULL) 
    { // This is a miss
	readMisses++;
	cacheLine *newline = allocateLine(addr);
	//int shared_line = sharers(addr) > 0; // newline is also a sharer, but
	// won't show up in count till we set its state
	newline->set_state(S); 
        memoryTransactions++;
        busRds++;
	return busRd; // Read miss --> BusRd
    }
    else 
    { // This is a hit
	updateLRU(line);
	return none; // Read hit, no bus action
    }
}

bus_op_t Msi_w::PrWr(ulong addr, int processorNumber) 
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
        busRdXs++;
	return busRdX; // Write miss --> BusUpd
    }
    else 
    {
	/** Since it's a hit, update LRU and update state **/
	updateLRU(line);
	state=line->get_state();
	if (state==M) 
        {
	    line->set_state(M);
	    return none; // No bus action needed
	}
	else if (state==S)
        { 
	    line->set_state(M);
            busUpgrs++;
	    return busUpgr; // Write hit in Sc or SM --> BusUpd
	}
	else return none; // Write hit in state M, no bus action
    }
}

cacheLine * Msi_w::allocateLine(ulong addr) { 
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

int Msi_w::BusRd(ulong addr) 
{
    cache_state state;    
    cacheLine * line=findLine(addr);
    if (line!=NULL) 
    { // If true, it was a hit, so change state appropriately
	state = line->get_state();
	if (state==M)
        {
          line->set_state(S);
          writeBacks++;
          memoryTransactions++;
        }
	return 1; 
    }
    else return 0; // because it was a miss.
}

int Msi_w::BusRdX(ulong addr) {
    cache_state state;    
    cacheLine * line=findLine(addr);
    if (line!=NULL) { // If true, it was a hit, so change state appropriately
	state = line->get_state();
	if (state==M)
        {
          line->set_state(I);
          writeBacks++;
          memoryTransactions++;
        }
        else if(state==S)
          line->set_state(I);
	return 1; 
    }
    else return 0; // because it was a miss.

}

int Msi_w::BusUpgr(ulong addr) {
    cache_state state;    
    cacheLine * line=findLine(addr);
    if (line!=NULL) { // If true, it was a hit, so change state appropriately
	state = line->get_state();
        if(state==S)
          line->set_state(I);
	return 1; 
    }
    else return 0; // because it was a miss.

}
