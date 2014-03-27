/*******************************************************
                        main.cc
               Ahmad Samih & Yan Solihin,
          {aasamih,solihin}@ece.ncsu.edu, 2009
       revised by Ed Gehringer, efg@ncsu.edu, 2014      
********************************************************/

#include <stdlib.h>
#include <assert.h>
#include <fstream>
using namespace std;

#include "cache.h"
#include "msi_w.h"
#include "msi.h"
#include "dragon.h"
#include "firefly.h"


const int max_processors = 16;
int num_processors;
Cache* processor_cache[max_processors];

// Return the number of sharers of the block at addr
int sharers(ulong addr) {
  int count = 0;
  for (int i = 0; i < num_processors; i++) {
    if (processor_cache[i]->findLine(addr) != NULL) count++;
  }
  return count;
}

int main(int argc, char *argv[])
{
    
    ifstream fin;
    FILE * pFile;

    if (argv[1] == NULL){
	printf("input format: ");
	printf("./smp_cache <cache_size> <assoc> <block_size> <num_processors> <trace_file> \n");
	exit(0);
    }

    int cache_size = atoi(argv[1]);
    int cache_assoc= atoi(argv[2]);
    int blk_size   = atoi(argv[3]);
    int cache_type   = atoi(argv[5]);
    num_processors = atoi(argv[4]);/*1, 2, 4, 8*/
    char *fname =  (char *)malloc(20);
     fname = argv[6];

    
    //*******prints out simulator configuration here*******//
    printf("===== 506 SMP Simulator configuration =====\n");
    printf("L1_SIZE:\t\t%d\n", cache_size);
    printf("L1_ASSOC:\t\t%d\n", cache_assoc);
    printf("L1_BLOCKSIZE:\t\t%d\n", blk_size);
    printf("NUMBER OF PROCESSORS:\t%d\n", num_processors);
    printf("COHERENCE PROTOCOL:\t\t%d\n", cache_type);
    printf("TRACE FILE:\t\t%s\n", fname);

 
    //*********************************************//
    //*****Created an array of caches here*********//
    //*********************************************//	 
    int i;
    for (i=0;i<num_processors;i++)
    {
      switch (cache_type)
      {
        case 0: processor_cache[i] = new Msi::Msi(cache_size, cache_assoc, blk_size,num_processors); break;
        case 1: processor_cache[i] = new Msi_w::Msi_w(cache_size, cache_assoc, blk_size,num_processors); break;
        case 2: processor_cache[i] = new Dragon::Dragon(cache_size, cache_assoc, blk_size,num_processors); break;
        case 3: processor_cache[i] = new Firefly::Firefly(cache_size, cache_assoc, blk_size,num_processors); break;
        default: break; 
      }
    }
    ///******************************************************************//
    //**  This opens the file to be read and reports an error if open  **//
    //**  fails							       **//
    ///******************************************************************//
    pFile = fopen (fname,"r");
    if (pFile == 0)
    {	
	printf("Trace file problem\n");
	exit(0);
    }
    ///******************************************************************//
    //**  Read trace file,line by line,				       **//
    //**  each (processor#, operation, address)		   	       **//
    //**  propagate each request down through memory hierarchy	       **//
    //**  by calling cachesArray[processor#]->Access(...)	       **//
    ///******************************************************************//
    int proc_no;
    char op;
    int addr;
    bus_op_t bus_op;
    
    while (fscanf(pFile, "%d %c %x", &proc_no, &op, &addr) != EOF) 
    {
      if (op == 'w')
	bus_op = processor_cache[proc_no]->PrWr((ulong) addr, proc_no);
	else bus_op = processor_cache[proc_no]->PrRd((ulong) addr, proc_no);

      if (bus_op==busRdX)
      { // Write miss, or write hit in Sc or Sm
          for (i=0; i<num_processors; i++)
          {
              if (i!=proc_no) 
              { 
                processor_cache[i]->BusRdX(addr);
              } 
          }
      }
      else if (bus_op==busRd)
      { // Read miss
          for (i=0; i<num_processors; i++)
          {
              if (i!=proc_no) 
              {
                processor_cache[i]->BusRd(addr);
              }
          }
      }
      else if (bus_op==busUpd)
      { // Read miss
          for (i=0; i<num_processors; i++)
          {
              if (i!=proc_no) 
              {
                processor_cache[i]->BusUpd(addr);
              }
          }
      }
      else if (bus_op==busUpgr)
      { // Read miss
          for (i=0; i<num_processors; i++)
          {
              if (i!=proc_no) 
              {
                processor_cache[i]->BusUpgr(addr);
              }
          }
      }
      else if (bus_op==none)
      { // Read hit, or write hit in state E or M
      }
    }

    fclose(pFile);

    ///*****************************************//
    //**  Print out statistics for all caches **//
    ///*****************************************//
    
    for (i=0; i<num_processors; i++)
    {
	processor_cache[i]->printStats(i);
    }
}
