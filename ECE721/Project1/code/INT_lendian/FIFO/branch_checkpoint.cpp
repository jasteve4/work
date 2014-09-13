#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include "FIFO.h"


BranchCheckPoint::BranchCheckPoint(int size)
{

    SMT                           = new unsigned int [size];
    checkpoint_FL_head_index      = 0; 
    checkpoint_GMB                = 0;

}
