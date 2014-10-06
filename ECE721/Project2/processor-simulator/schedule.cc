#include "processor.h"


void processor::schedule() {
   IQ_INT.select_and_issue(issue_width, Execution_Lanes);	// Issue instructions from integer IQ to the Execution Lanes.
   IQ_FP.select_and_issue(issue_width, Execution_Lanes);	// Issue instructions from floating-point IQ to the Execution Lanes.
}
