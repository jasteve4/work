#include "renamer.h"

renamer *REN_INT;
renamer *REN_FP;

void REN__renamer(bool sel, unsigned int n_log_regs, unsigned int n_phys_regs, unsigned int n_branches) {
	if (sel)
	   REN_INT = new renamer(n_log_regs, n_phys_regs, n_branches);
	else
	   REN_FP = new renamer(n_log_regs, n_phys_regs, n_branches);
}

bool REN__stall_reg(bool sel, unsigned int bundle_dst) {
	if (sel)
	   return( REN_INT->stall_reg(bundle_dst) );
	else
	   return( REN_FP->stall_reg(bundle_dst) );
}

bool REN__stall_branch(bool sel, unsigned int bundle_branch) {
	if (sel)
	   return( REN_INT->stall_branch(bundle_branch) );
	else
	   return( REN_FP->stall_branch(bundle_branch) );
}

unsigned long long REN__get_branch_mask(bool sel) {
	if (sel)
	   return( REN_INT->get_branch_mask() );
	else
	   return( REN_FP->get_branch_mask() );
}

unsigned int REN__rename_rsrc(bool sel, unsigned int log_reg) {
	if (sel)
	   return( REN_INT->rename_rsrc(log_reg) );
	else
	   return( REN_FP->rename_rsrc(log_reg) );
}

unsigned int REN__rename_rdst(bool sel, unsigned int log_reg) {
	if (sel)
	   return( REN_INT->rename_rdst(log_reg) );
	else
	   return( REN_FP->rename_rdst(log_reg) );
}

unsigned int REN__checkpoint(bool sel) {
	if (sel)
	   return( REN_INT->checkpoint() );
	else
	   return( REN_FP->checkpoint() );
}

bool REN__stall_dispatch(bool sel, unsigned int bundle_inst) {
	if (sel)
	   return( REN_INT->stall_dispatch(bundle_inst) );
	else
	   return( REN_FP->stall_dispatch(bundle_inst) );
}
	
unsigned int REN__dispatch_inst(bool sel, bool dest_valid, unsigned int log_reg, unsigned int phys_reg, bool load, bool store, bool branch, unsigned int PC) {
	if (sel)
	   return( REN_INT->dispatch_inst(dest_valid, log_reg, phys_reg, load, store, branch, PC) );
	else
	   return( REN_FP->dispatch_inst(dest_valid, log_reg, phys_reg, load, store, branch, PC) );
}

bool REN__is_ready(bool sel, unsigned int phys_reg) {
	if (sel)
	   return( REN_INT->is_ready(phys_reg) );
	else
	   return( REN_FP->is_ready(phys_reg) );
}

void REN__clear_ready(bool sel, unsigned int phys_reg) {
	if (sel)
	   REN_INT->clear_ready(phys_reg);
	else
	   REN_FP->clear_ready(phys_reg);
}

void REN__set_ready(bool sel, unsigned int phys_reg) {
	if (sel)
	   REN_INT->set_ready(phys_reg);
	else
	   REN_FP->set_ready(phys_reg);
}

unsigned long long REN__read(bool sel, unsigned int phys_reg) {
	if (sel)
	   return( REN_INT->read(phys_reg) );
	else
	   return( REN_FP->read(phys_reg) );
}

void REN__write(bool sel, unsigned int phys_reg, unsigned long long value) {
	if (sel)
	   REN_INT->write(phys_reg, value);
	else
	   REN_FP->write(phys_reg, value);
}

void REN__set_complete(bool sel, unsigned int AL_index) {
	if (sel)
	   REN_INT->set_complete(AL_index);
	else
	   REN_FP->set_complete(AL_index);
}

void REN__resolve(bool sel, unsigned int AL_index, unsigned int branch_ID, bool correct) {
	if (sel)
	   REN_INT->resolve(AL_index, branch_ID, correct);
	else
	   REN_FP->resolve(AL_index, branch_ID, correct);
}

void REN__commit(bool sel, bool &committed, bool &load, bool &store, bool &branch, bool &exception, unsigned int &offending_PC) {
	if (sel)
	   REN_INT->commit(committed, load, store, branch, exception, offending_PC);
	else
	   REN_FP->commit(committed, load, store, branch, exception, offending_PC);
}

void REN__set_exception(bool sel, unsigned int AL_index) {
	if (sel)
	   REN_INT->set_exception(AL_index);
	else
	   REN_FP->set_exception(AL_index);
}
