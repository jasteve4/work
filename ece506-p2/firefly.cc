/*******************************************************
			 firefly.cc
		       Ryan Clarke
		    rkclarke@ncsu.edu, 2014
********************************************************/
		     
#include <stdlib.h>
#include <assert.h>
#include <stdio.h>
#include "main.h"
#include "cache.h"
#include "firefly.h"
using namespace std;

bus_op_t Firefly::PrRd(ulong addr, int processorNumber)
{
    currentCycle++; /* Per-cache global counter to maintain LRU order 
					 among cache ways, updated on every cache access */
    reads++;
    cacheLine *line = findLine(addr);
    if (line == NULL) // This is a miss
    {
		readMisses++;
		cacheLine *newline = allocateLine(addr);
		int shared_line = sharers(addr) > 0; // newline is also a sharer, but
			// won't show up in count till we set its state
		if (shared_line) {newline->set_state(S); cache2cache++;}
		else {newline->set_state(V); memoryTransactions++;}
		
		busRds++;
		return busRd; // Read miss --> BusRd
    }
    else // This is a hit
    {
		updateLRU(line);
		return none; // Read hit, no bus action
    }
}

bus_op_t Firefly::PrWr(ulong addr, int processorNumber)
{
    cache_state state;
    currentCycle++;
    writes++;
    cacheLine *line = findLine(addr);
    if (line == NULL) /* This is a miss */
    {
		writeMisses++;
		cacheLine *newline = allocateLine(addr);
		int shared_line = sharers(addr) > 0; // see comment in PrRd method
		if (shared_line) {newline->set_state(S); cache2cache++;} 
		else {newline->set_state(D); memoryTransactions++;}

		busUpds++;
		return busUpd; // Write miss --> BusUpd
    }
    else
    {
		/** Since it's a hit, update LRU and update state **/
		updateLRU(line);
		state=line->get_state();
		if (state==V)
		{
			line->set_state(D);
			return none; // No bus action needed
		}
		else if (state==S)
		{
			int shared_line = sharers(addr) > 1;
			if (shared_line) {line->set_state(S);}
			else {line->set_state(D);}

			busUpds++;
			return busUpd; // Write hit in S --> BusUpd
		}
		else return none; // Write hit in state D, no bus action
	}
}

cacheLine *Firefly::allocateLine(ulong addr)
{
    ulong tag;
    cache_state state;
   
    cacheLine *victim = findLineToReplace(addr);
    assert(victim != 0);
    state = victim->get_state();
    if (state==D)
    {
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

int Firefly::BusRd(ulong addr)
{
    cache_state state;    
    cacheLine *line=findLine(addr);
    if (line!=NULL) // If true, it was a hit, so change state appropriately
    {
		state = line->get_state();
		line->set_state(S);
		return 1; 
    }
    else return 0; // because it was a miss.
}

int Firefly::BusUpd(ulong addr)
{
    cacheLine *line=findLine(addr);
    if (line!=NULL) // If true, it was a hit, so change state appropriately
    {
		line->set_state(S);
		return 1;
    }
    else return 0; // because it was a miss.
}
