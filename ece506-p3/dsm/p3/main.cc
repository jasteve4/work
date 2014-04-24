/*******************************************************
                        main.cc
               Ahmad Samih & Yan Solihin,
          {aasamih,solihin}@ece.ncsu.edu, 2009
       revised by Ed Gehringer, efg@ncsu.edu, 2014      
********************************************************/

#include <stdlib.h>
#include <assert.h>
#include <fstream>
#include <iostream>
#include <string.h>
using namespace std;

#include "cache.h"
#include "mesi.h"
#include "main.h"

const int max_processors = 16;
int blk_size;
Directory * directory;
Cache* processor_cache[max_processors];

// Return the number of sharers of the block at addr
int sharers(ulong addr) {
  int count = 0;
  for (int i = 0; i < NUM_PROCESSORS; i++) {
    if (processor_cache[i]->findLine(addr) != NULL) count++;
  }
  return count;
}

void sendInv(ulong addr, int proc_num) {
    ulong dir_tag = addr >> (int) log2(blk_size);
    dirEntry * dir_entry = directory->findEntry(dir_tag);
    for (int i = 0; i<NUM_PROCESSORS; i++)
	if (i != proc_num && dir_entry->bit[i]) {
	    dir_entry->bit[i] = false;
	    processor_cache[i]->Inv(addr);
    }
}

void sendInt(ulong addr, int proc_num) {
    ulong dir_tag = addr >> (int) log2(blk_size);
    dirEntry * dir_entry = directory->findEntry(dir_tag);
    for (int i = 0; i<NUM_PROCESSORS; i++)
	if (i != proc_num && dir_entry->bit[i]) {
	    processor_cache[i]->Int(addr);
    }
}

int main(int argc, char *argv[])
{
    ifstream fin;
    FILE * pFile;

    if (argv[1] == NULL){
	printf("input format: ");
	printf("./dsm_cache <cache_size> <assoc> <block_size> <trace_file> \n");
	exit(0);
    }

    int cache_size = atoi(argv[1]);
    int cache_assoc= atoi(argv[2]);
    blk_size   = atoi(argv[3]);
    char *fname =  (char *)malloc(20);
    fname = argv[4];
    
    //*******prints out simulator configuration here*******//
    printf("===== 506 DSM MESIF FBV simulator configuration =====\n");
    printf("L1_SIZE:\t\t%d\n", cache_size);
    printf("L1_ASSOC:\t\t%d\n", cache_assoc);
    printf("L1_BLOCKSIZE:\t\t%d\n", blk_size);
    printf("NUMBER OF PROCESSORS:\t%d\n", NUM_PROCESSORS);
    printf("TRACE FILE:\t\t%s\n", fname);
 
    //*********************************************//
    //******Create an array of caches here*********//
    //*********************************************//	 
    ulong dirSize = cache_size*NUM_PROCESSORS/blk_size;
    directory = new Directory(dirSize);

    for (int i = 0; i < NUM_PROCESSORS; i++) {
      processor_cache[i] = new MESI(cache_size, cache_assoc, blk_size, i);
      processor_cache[i]->setDirectory(directory);
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
    //**  by calling cacheArray[processor#]->Access(...)	       **//
    ///******************************************************************//
    int proc_no;
    char op;
    int addr;
    
    while (fscanf(pFile, "%d %c %x", &proc_no, &op, &addr) != EOF) {
      if (op == 'w')
	processor_cache[proc_no]->PrWr((ulong) addr, proc_no);
      else
	processor_cache[proc_no]->PrRd((ulong) addr, proc_no);
    }


    fclose(pFile);

    ///*****************************************//
    //**  Print out statistics for all caches **//
    ///*****************************************//
    
    for (int i=0; i<NUM_PROCESSORS; i++)
    {
	processor_cache[i]->printStats(i);
    }
}
