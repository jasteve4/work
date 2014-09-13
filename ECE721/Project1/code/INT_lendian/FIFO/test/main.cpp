#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include "FIFO.h"

int main()
{
  //unsigned int i = -1;
 /* cout << "========intizaing FreeFIFO==========" << endl;
  FreeFIFO free_list (1024);
  while(!free_list.full){
  i++; 
  free_list.Push(i);}
  cout << "=========Begin==================" << endl;
  while(!free_list.empty) cout << free_list.Pop() << endl;
  cout << "=================================" << endl;
  ActiveFIFO active_list (1024);
  while(!active_list.full){
  i++; 
  active_list.Push(i);
  }
  cout << "=========Begin==================" << endl;
  while(!active_list.empty) cout << active_list.Pop() << endl;
  cout << "=================================" << endl;*/
 // BranchCheckPoint branch_check_point (1024);
 // cout << branch_check_point.checkpoint_GMB << endl;
  
  FreeFIFO free_list (1024);
  free_list.entry[0].physical_reg = 0
  
  return 0;
  
}
