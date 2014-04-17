/*******************************************************
                        cache.cc
               Ahmad Samih & Yan Solihin,
          {aasamih,solihin}@ece.ncsu.edu, 2009
       revised by Ed Gehringer, efg@ncsu.edu, 2014      
********************************************************/
		     
#include <stdlib.h>
#include <assert.h>
#include <stdio.h>
#include "main.h"
#include "cache.h"
using namespace std;

Cache::Cache(int s, int a, int b, int p )
{
  ulong i, j;
   // counters
   reads = readMisses = writes = 0; 
   writeMisses = writeBacks = currentCycle = 0;
   memoryTransactions = cache2cache = 0;
   busRds = busRdXs = busUpgrs = busUpds = 0;

   // simulation parameters
   num_processors=(ulong) (p);
   size	      = (ulong)(s);
   lineSize   = (ulong)(b);
   assoc      = (ulong)(a);   
   sets	      = (ulong)((s/b)/a);
   numLines   = (ulong)(s/b);
   log2Sets   = (ulong)(log2(sets));   
   log2Blk    = (ulong)(log2(b));   
 
   tagMask =0;
   for (i=0;i<log2Sets;i++)
   {
	tagMask <<= 1;
	tagMask |= 1;
   }
   
   /** Create a 2-dimensional cache, sized as cache[sets][assoc] **/ 
   cache = new cacheLine*[sets];
   for (i=0; i<sets; i++)
   {
      cache[i] = new cacheLine[assoc];
      for (j=0; j<assoc; j++) 
      {
	cache[i][j].set_state(empty);
      }
   }	  
}

/* Look up line */
cacheLine * Cache::findLine(ulong addr)
{
   ulong i, j, tag, pos;
   
   pos = assoc;
   tag = tagField(addr);
   i   = indexField(addr);
  
   for (j=0; j<assoc; j++)
    if (cache[i][j].valid())
	if (cache[i][j].get_tag() == tag) {
	    pos = j; break; 
	}
    if (pos == assoc)
	return NULL;
    else
	return &(cache[i][pos]); 
}

/* Upgrade LRU line to be MRU line */
void Cache::updateLRU(cacheLine *line)
{
  line->set_seq(currentCycle);  
}

/* Return an invalid line, if any; otherwise return the LRU line */
cacheLine * Cache::getLRU(ulong addr)
{
   ulong i, j, victim, min;

    victim = assoc;
    min	  = currentCycle;
    i	  = indexField(addr);

    for (j=0; j<assoc; j++)
    {
       if (!cache[i][j].valid()) return &(cache[i][j]);
    }   
    for (j=0; j<assoc; j++)   {
	if (cache[i][j].get_seq() <= min) {
	    victim = j; min = cache[i][j].get_seq();}
    } 
    assert(victim != assoc);

    return &(cache[i][victim]);
}

/* Find a victim, and move it to the MRU position */
cacheLine *Cache::findLineToReplace(ulong addr)
{
   cacheLine * victim = getLRU(addr);
   updateLRU(victim);
  
   return (victim);
}

void Cache::printStats(int processorNumber)
{ 
	cout << "f=========== Simulation results (Cache " << processorNumber << ") ============" << endl;
	printf("number of reads, ");
	cout << (int) getReads();
	cout << endl;
	printf("number of read misses, ");
	cout << (int) getRM();
	cout << endl;
	printf("number of writes, ");
	cout << (int) getWrites();
	cout << endl;
	printf("number of write misses,");
	cout << (int) getWM();
	cout << endl;	
	printf("number of BusRds issued,");
	cout << (int) getBusReads();
	cout << endl;	
	printf("number of BusRdXs issued,");
	cout << (int) getBusReadXs();
	cout << endl;	
	printf("number of BusUpgrs issued,");
	cout << (int) getBusUpgrs();
	cout << endl;	
	printf("number of BusUpds issued,");
	cout << (int) getBusUpds();
	cout << endl;	
        printf("total miss rate, ");
	printf("%.6lf", ((double) getRM() + (double) getWM()) / ((double) getReads() + (double) getWrites()));
	cout << endl;
	printf("number of writebacks, ");
	cout << (int) getWB();
	cout << endl;
	printf("number of memory transactions, ");
	cout << (int) getmemTrans();
	cout << endl;
	printf("number of cache-to-cache transfers, ");
	cout<<(int)getcache2cache();
	cout << endl;
}