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
#include "dragon.h"
using namespace std;

bus_op_t Dragon::PrRd(ulong addr, int processorNumber)
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
		if (shared_line) {newline->set_state(Sc); cache2cache++;}
		else {newline->set_state(E); memoryTransactions++;}
		return busRd; // Read miss --> BusRd
    }
    else // This is a hit
    {
		updateLRU(line);
		return none; // Read hit, no bus action
    }
}

bus_op_t Dragon::PrWr(ulong addr, int processorNumber)
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
		if (shared_line) {newline->set_state(Sm); cache2cache++;} 
		else {newline->set_state(M); memoryTransactions++;}

		return busUpd; // Write miss --> BusUpd
    }
    else
    {
		/** Since it's a hit, update LRU and update state **/
		updateLRU(line);
		state=line->get_state();
		if (state==E)
		{
			line->set_state(M);
			return none; // No bus action needed
		}
		else if (state==Sc || state==Sm)
		{
			int shared_line = sharers(addr) > 1;
			if (shared_line) {line->set_state(Sm);}
			else {line->set_state(M);}

			return busUpd; // Write hit in Sc or SM --> BusUpd
		}
		else return none; // Write hit in state M, no bus action
	}
}

cacheLine *Dragon::allocateLine(ulong addr)
{
    ulong tag;
    cache_state state;
   
    cacheLine *victim = findLineToReplace(addr);
    assert(victim != 0);
    state = victim->get_state();
    if (state== Sm || state==M)
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

int Dragon::BusRd(ulong addr)
{
    cache_state state;    
    cacheLine *line=findLine(addr);
    if (line!=NULL) // If true, it was a hit, so change state appropriately
    {
		state = line->get_state();
		if (state==E) {line->set_state(Sc);}
		else if (state==M) {line->set_state(Sm);}
		return 1; 
    }
    else return 0; // because it was a miss.
}

int Dragon::BusUpd(ulong addr)
{
    cacheLine *line=findLine(addr);
    if (line!=NULL) // If true, it was a hit, so change state appropriately
    {
		line->set_state(Sc);
		return 1;
    }
    else return 0; // because it was a miss.
}
