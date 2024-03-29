#include "processor.h"


////////////////////////////////////////////////////////////////////////////////////
// The Rename Stage has two sub-stages:
// rename1: Get the next rename bundle from the FQ.
// rename2: Rename the current rename bundle.
////////////////////////////////////////////////////////////////////////////////////

void processor::rename1() {
   unsigned int i;

   ////////////////////////////////////////////////////////////////////////////////////
   // Try to get the next rename bundle.
   // Two conditions might prevent getting the next rename bundle, either:
   // (1) The current rename bundle is stalled in rename2.
   // (2) The FQ does not have enough instructions for a full rename bundle.
   ////////////////////////////////////////////////////////////////////////////////////

   // Check the first condition. Is the current rename bundle stalled, preventing
   // insertion of the next rename bundle? Check whether or not the pipeline register
   // between rename1 and rename2 still has a rename bundle.

   if (RENAME2[0].valid)	// The current rename bundle is stalled.
      return;
      
   // Check the second condition. Does the FQ have enough instructions for a full
   // rename bundle?

   if (!FQ.bundle_ready(dispatch_width))
      return;

   // Get the next rename bundle:
   // The FQ has a rename bundle and there is space for it in the Rename Stage.
   for (i = 0; i < dispatch_width; i++) {
      RENAME2[i].valid = true;
      RENAME2[i].index = FQ.pop();
   }
}

void processor::rename2() {
   unsigned int i;
   unsigned int index;
   unsigned int num_checkpoints = 0;
   unsigned int num_int_dest_reg = 0;
   unsigned int num_float_dest_reg = 0;
   bool stall_check_int;
   bool stall_check_float;
   bool stall_reg_int;
   bool stall_reg_float;
   unsigned int int_checkpoint; 
   unsigned int fp_checkpoint; 

   // Stall the rename2 sub-stage if either:
   // (1) There isn't a current rename bundle.
   // (2) The Dispatch Stage is stalled.
   // (3) There aren't enough rename resources for the current rename bundle.

   if (!RENAME2[0].valid ||	// First stall condition: There isn't a current rename bundle.
       DISPATCH[0].valid)	// Second stall condition: The Dispatch Stage is stalled.
      return;

   // Third stall condition: There aren't enough rename resources for the current rename bundle.
   for (i = 0; i < dispatch_width; i++) {
      assert(RENAME2[i].valid);
      index = RENAME2[i].index;

      // FIX_ME #1
      // Count the number of instructions in the rename bundle that need a checkpoint (most branches).
      // Count the number of instructions in the rename bundle that have an integer destination register.
      // Count the number of instructions in the rename bundle that have a floating-point destination register.
   
      
      // With these counts, you will be able to query the integer and floating-point renamers for resource availability
      // (checkpoints and physical registers).
      //
      // Tips:
      // 1. The loop construct, for iterating through all instructions in the rename bundle (0 to dispatch_width),
      //    is already provided for you, above. Note that this comment is within the loop.
      // 2. At this point of the code, 'index' is the instruction's index into PAY.buf[] (payload).
      // 3. The instruction's payload has all the information you need to count resource needs.
      //    There is a flag in the instruction's payload that *directly* tells you if this instruction needs a checkpoint.
      //    Other fields indicate whether or not the instruction has a destination register and its type.

   if(PAY.buf[index].checkpoint)  num_checkpoints++;

   if(PAY.buf[index].C_valid)  
        if(PAY.buf[index].C_int) 
            num_int_dest_reg++; 
        else
            num_float_dest_reg++; 



   }

   // FIX_ME #2
   // Check if the Rename2 Stage must stall due to any of the following conditions:
   // * Not enough free checkpoints.

   // * Not enough free integer physical registers.

   // * Not enough free floating-point physical registers.

   // If there are not enough resources for the *whole* rename bundle, then stall the Rename2 Stage.
   // Stalling is achieved by returning from this function ('return').
   // If there are enough resources for the *whole* rename bundle, then do not stall the Rename2 Stage.
   // This is achieved by doing nothing and proceeding to the next statements.
   //
   // Tips:
   // 1. Check the stall_branch() functions for both the integer and floating-point renamers.
   //    Assert that they return the same result, since they have the same number of checkpoints.
   // 2. Check the stall_reg() functions for both the integer and floating-point renamers,
   //    passing in the correct argument to each.
   // 3. If you need to stall, you do it by hard exiting this function with 'return'. Otherwise do nothing.



   stall_check_int = REN__stall_branch(true,num_checkpoints);
   stall_check_float = REN__stall_branch(false,num_checkpoints);

   assert(stall_check_int == stall_check_float);

   stall_reg_int = REN__stall_reg(true,num_int_dest_reg);
   stall_reg_float = REN__stall_reg(false,num_float_dest_reg);

   if(stall_check_int || stall_check_float || stall_reg_int || stall_reg_float)
      return;

   //
   // Sufficient resources are available to rename the rename bundle.
   //
   for (i = 0; i < dispatch_width; i++) {
      assert(RENAME2[i].valid);
      index = RENAME2[i].index;

      // FIX_ME #3
      // Rename source registers (first) and destination register (second).
      // Tips:
      // 1. At this point of the code, 'index' is the instruction's index into PAY.buf[] (payload).
      // 2. The instruction's payload has all the information you need to rename registers, if they exist. In particular:
      //    * whether or not the instruction has a first source register, its logical register number, and its type
      //    * whether or not the instruction has a second source register, its logical register number, and its type
      //    * whether or not the instruction has a destination register, its logical register number, and its type
      // 3. When you rename a logical register to a physical register, remember to *update* the instruction's payload with the physical register specifier,
      //    so that the physical register specifier can be used in subsequent pipeline stages.
 
      if(PAY.buf[index].A_valid)
      {
         if(PAY.buf[index].A_int)
            PAY.buf[index].A_phys_reg = REN__rename_rsrc(true,PAY.buf[index].A_log_reg);
         else
            PAY.buf[index].A_phys_reg = REN__rename_rsrc(false,PAY.buf[index].A_log_reg);
      } 

      if(PAY.buf[index].B_valid)
      {
         if(PAY.buf[index].B_int)
            PAY.buf[index].B_phys_reg = REN__rename_rsrc(true,PAY.buf[index].B_log_reg);
         else
            PAY.buf[index].B_phys_reg = REN__rename_rsrc(false,PAY.buf[index].B_log_reg);
      }
      
      if(PAY.buf[index].C_valid)
      {
         if(PAY.buf[index].C_int)
            PAY.buf[index].C_phys_reg = REN__rename_rdst(true,PAY.buf[index].C_log_reg);
         else
            PAY.buf[index].C_phys_reg = REN__rename_rdst(false,PAY.buf[index].C_log_reg);
      }




      // FIX_ME #4
      // Get the instruction's branch mask.
      // Tips:
      // 1. Every instruction gets a branch_mask. An instruction needs to know which branches it depends on, for possible squashing.
      // 2. The branch_mask is not held in the instruction's PAY.buf[] entry. Rather, it explicitly moves with the instruction
      //    from one pipeline stage to the next. Normally the branch_mask would be wires at this point in the logic but since we
      //    don't have wires place it temporarily in the RENAME2[] pipeline register alongside the instruction, until it advances
      //    to the DISPATCH[] pipeline register. The required left-hand side of the assignment statement is already provided for you below:
      //    RENAME2[i].branch_mask = ??;
      // 3. Both renamers should return the same branch_mask because their checkpoints are managed identically.
      //    You should assert this: get branch_mask's from both renamers and assert they are identical.

      RENAME2[i].branch_mask = REN__get_branch_mask(true);
      assert(RENAME2[i].branch_mask == REN__get_branch_mask(false));



      // FIX_ME #5
      // If this instruction requires a checkpoint (most branches), then create a checkpoint.
      // Tips:
      // 1. At this point of the code, 'index' is the instruction's index into PAY.buf[] (payload).
      // 2. There is a flag in the instruction's payload that *directly* tells you if this instruction needs a checkpoint.
      // 3. If a checkpoint is needed, you must create a checkpoint in both the integer and floating-point renamers.
      //    Assert that they return the same branch ID, since their checkpoints are managed identically.
      // 4. If you create a checkpoint, remember to *update* the instruction's payload with its branch ID
      //    so that the branch ID can be used in subsequent pipeline stages.

      if(PAY.buf[index].checkpoint)
      {
            int_checkpoint = REN__checkpoint(true);
            fp_checkpoint = REN__checkpoint(false);
            assert(int_checkpoint == fp_checkpoint);
            PAY.buf[index].branch_ID = int_checkpoint;
      }




   }


   //
   // Transfer the rename bundle from the Rename Stage to the Dispatch Stage.
   //
   for (i = 0; i < dispatch_width; i++) {
      assert(RENAME2[i].valid && !DISPATCH[i].valid);
      RENAME2[i].valid = false;
      DISPATCH[i].valid = true;
      DISPATCH[i].index = RENAME2[i].index;
      DISPATCH[i].branch_mask = RENAME2[i].branch_mask;
   }
}
