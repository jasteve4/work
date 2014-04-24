/*******************************************************
			 mesi.cc
		       Gautam Philar/ Joshua Stevens
********************************************************/
		     
#include <stdlib.h>
#include <assert.h>
#include <stdio.h>
#include "main.h"
#include "cache.h"
#include "mesi.h"
using namespace std;

void MESI::PrRd(ulong addr, int processorNumber) {
    this->currentCycle++; /* Per-cache global counter to maintain LRU order
            among cache ways, updated on every cache access */
    this->reads++;
    /* check if this line already exists in the cache */
    cacheLine * line = this->findLine(addr);
    if (line == NULL) { /* PrRd miss, block state has to be invalid */
        this->readMisses++;
	
	/* PrRd miss, send the read to the directory */
        this->signalRd(addr, processorNumber);

        cacheLine *newline = this->allocateLine(addr, processorNumber);
	int shared_line = sharers(addr) > 0;
	if (shared_line) {
	   /* block is in peer caches, so mark as shared */
	   newline->set_state(S);
	} else {
	  /* block not in peer caches, mark as E */
	  newline->set_state(E);
	  this->memoryTransactions++;
	}
    } else { /* PrRd hit, block state has to be S or M, remains unchanged */
        this->updateLRU(line);
        /* PrRd hit, nothing to do, Directory should have the correct state */
    }
}

void MESI::PrWr(ulong addr, int processorNumber) {
    cache_state state;
    this->currentCycle++;
    this->writes++;
    cacheLine * line = this->findLine(addr);
    if (line == NULL) { /* PrWr miss, block state has to be invalid */
        this->writeMisses++;
	this->memoryTransactions++;
        cacheLine *newline = this->allocateLine(addr, processorNumber);
	/* PrWr miss, send the write to the directory */
	this->signalRdX(addr, processorNumber);
	/* change the state in the local cache */
        newline->set_state(M);
    } else {
        /* PrWr hit, update LRU, has to be in M or S, update state */
        updateLRU(line);
        state = line->get_state();
        /* if in M, no change to state */
        /* if in S, change to M and perform DSM related activities */
        if (state == S) {
	   /* PrWr hit, send an Upgr req to the directory */
	   this->signalUpgr(addr, processorNumber);
           line->set_state(M);
           /* PrWr hit in S, perform DSM related activities */
        } else {
           /* PrWr hit in state M or E, directory should be EM for this block */
	   line->set_state(M);
        }
    }
}

cacheLine * MESI::allocateLine(ulong addr, int processorNumber) {
    ulong tag, victim_tag;
    cache_state state;

    cacheLine *victim = this->findLineToReplace(addr);
    assert(victim != 0);
    state = victim->get_state();
    if (state == M) { /* modified, has to be written to main memory */
        this->writeBack(addr);
        this->memoryTransactions++;
    }

    victim_tag = victim->get_tag();
    tag = this->tagField(addr);
    victim->set_tag(tag);
    victim->set_state(empty);

    /* notify the directory that this victim block is getting evicted */
    dirEntry *d_entry = this->directory->findEntry(victim_tag);
    if(d_entry != NULL) {
      if(d_entry->state == EM) {
	d_entry->tag = 0;
	d_entry->state = U;
	d_entry->bit[processorNumber] = false;
      } else { /* this block is shared */
	d_entry->bit[processorNumber] = false;
      }
    }
    /** Note that this cache line has already been upgraded to MRU
     in the previous function (findLineToReplace)**/
    return victim;
}

void MESI::signalRd(ulong addr, int processorNumber) {
    /* check if this block is in the directory and has any sharers */
    /* if not in directory, get it from memory, sharing vector should be all zeroes */
    /* insert into directory and mark the state to be EM */
    /* if in directory, update sharing vector and mark state as S */
    ulong tag = this->tagField(addr);
    dirEntry *d_entry = this->directory->findEntry(tag);
    if(d_entry != NULL) {
       /* in the directory, update sharing vector and state */
       /* check the state of the block */
       if(d_entry->state == EM) {
	 /* send intervention to owner node and change state */
	 this->cache2cache++;
	 sendInt(addr, processorNumber);
	 d_entry->state = S_;
       } else {
	 /* nothing to do if shared state S_ */
       }
       d_entry->bit[processorNumber] = true;
    } else {
       /* not in directory, mark state to be EM */
       d_entry = this->directory->findUncached(tag);
       d_entry->tag = tag;
       d_entry->state = EM;
       d_entry->bit[processorNumber] = true;
    }
}

void MESI::signalRdX(ulong addr, int processorNumber) {
    /* check if this block is in the directory and has any sharers */
    /* if not in directory, get it from memory, sharing vector should be all zeroes */
    /* insert into directory and mark the state to be EM */
    /* if in directory, update sharing vector and mark state as S */
    ulong tag = this->tagField(addr);
    dirEntry *d_entry = this->directory->findEntry(tag);
    if(d_entry != NULL) {
       /* in the directory, update sharing vector and state */
       /* check the state of the block */
       if(d_entry->state == EM) {
         /* send invalidation to owner node and change state */
	 this->cache2cache++;
         sendInv(addr, processorNumber);
         d_entry->state = EM;
       } else {
         /* if shared state S */
	 sendInv(addr, processorNumber);
	 d_entry->state = EM;
       }
       d_entry->bit[processorNumber] = true;
    } else {
       /* not in directory, mark state to be EM */
       d_entry = this->directory->findUncached(tag);
       d_entry->tag = tag;
       d_entry->state = EM;
       d_entry->bit[processorNumber] = true;
    }
}

void MESI::signalUpgr(ulong addr, int processorNumber) {
    /* check if this block is in the directory and has any sharers */
    /* if not in directory, get it from memory, sharing vector should be all zeroes */
    /* insert into directory and mark the state to be EM */
    /* if in directory, update sharing vector and mark state as S */
    ulong tag = this->tagField(addr);
    dirEntry *d_entry = this->directory->findEntry(tag);
    if(d_entry != NULL) {
       /* in the directory, update sharing vector and state */
       /* check the state of the block */
       if(d_entry->state == S_) {
         /* send intervention to owner node and change state */
         sendInv(addr, processorNumber);
         d_entry->state = EM;
	 d_entry->bit[processorNumber] = true;
       }
    }
}

void MESI::Int(ulong addr) {
    /* handle scenario when this cache receives an Intervention */
    /* E/M -> S */
    cacheLine *line = this->findLine(addr);
    cache_state state;
    this->interventions++;
    if (line != NULL) {
       state = line->get_state();
       if(state == M || state == E) {
	 this->writeBack(addr);
       }
       line->set_state(S);
    }
}

void MESI::Inv(ulong addr) {
    /* handle scenario when this cache receives an Invalidation */
    /* change state of block in local cache to I */
    cacheLine *line = this->findLine(addr);
    cache_state state;
    this->invalidations++;
    if (line != NULL) {
       state = line->get_state();
       if(state == M) {
	/* received an Inv, flush if state is M */
	this->writeBack(addr);
       }
       line->set_state(I);
    }
}

void MESI::notifyCtrl(ulong) {

}
