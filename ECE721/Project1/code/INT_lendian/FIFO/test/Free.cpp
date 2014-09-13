#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include "FIFO.h"

FreeList::FreeList()
{
    this->physical_reg = 0;

}

//FreeFIFO::FreeFIFO() {}

FreeFIFO::FreeFIFO ( unsigned int size )
{
    this->head_pointer    = 0; 
    this->tail_pointer    = 0;
    this->size            = size;
    this->entry_count     = 0;
    this->empty           = true;
    this->full            = false;
    this->entry           = new FreeList [size];
}

void FreeFIFO::Push(unsigned int phy_reg)
{
  this->entry_count++;
  if(this->entry_count == this->size)
  {
    this->full            = true;
  }
  else
  {
    this->full            = false;
  }
  this->empty             = false;
  if(this->tail_pointer == this->size-1)
  {
    this->tail_pointer = 0;
    this->entry[this->size-1].physical_reg = phy_reg;
  }
  else
  {
    this->tail_pointer++;
    this->entry[this->tail_pointer-1].physical_reg = phy_reg;
  }
}


unsigned int FreeFIFO::Pop()
{
  unsigned int temp;
  this->entry_count--;
  if(this->entry_count == 0)
  {
    this->empty = true;
  }
  else
  {
    this->empty = false;
  }
  this->full = false;
  if(this->head_pointer == this->size-1)
  {
    this->head_pointer = 0;
    temp = this->entry[this->size-1].physical_reg;
  }
  else
  {
    this->head_pointer++;
    temp = this->entry[this->head_pointer-1].physical_reg;
  }
  return temp;
}


unsigned int FreeFIFO::Walk_Back() {return 0;}


void FreeFIFO::Walk_Forward() {}


// Used to revert the tail back to the head for the active list..
void FreeFIFO::Reset_Head()
{
  this->head_pointer = this->tail_pointer;
  this->entry_count = 0;
  this->empty = true;
  this->full = false;
}

// Used to advance to head to the tail for the free list
void FreeFIFO::Reset_Tail()
{
  this->head_pointer = this->tail_pointer;
  this->entry_count = this->size;
  this->empty = false;
  this->full = true;
}

