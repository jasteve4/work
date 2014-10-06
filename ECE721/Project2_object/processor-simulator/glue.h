extern
void REN__renamer(bool sel, unsigned int n_log_regs, unsigned int n_phys_regs, unsigned int n_branches);

extern
bool REN__stall_reg(bool sel, unsigned int bundle_dst);

extern
bool REN__stall_branch(bool sel, unsigned int bundle_branch);

extern
unsigned long long REN__get_branch_mask(bool sel);

extern
unsigned int REN__rename_rsrc(bool sel, unsigned int log_reg);

extern
unsigned int REN__rename_rdst(bool sel, unsigned int log_reg);

extern
unsigned int REN__checkpoint(bool sel);

extern
bool REN__stall_dispatch(bool sel, unsigned int bundle_inst);
	
extern
unsigned int REN__dispatch_inst(bool sel, bool dest_valid, unsigned int log_reg, unsigned int phys_reg, bool load, bool store, bool branch, unsigned int PC);

extern
bool REN__is_ready(bool sel, unsigned int phys_reg);

extern
void REN__clear_ready(bool sel, unsigned int phys_reg);

extern
void REN__set_ready(bool sel, unsigned int phys_reg);

extern
unsigned long long REN__read(bool sel, unsigned int phys_reg);

extern
void REN__write(bool sel, unsigned int phys_reg, unsigned long long value);

extern
void REN__set_complete(bool sel, unsigned int AL_index);

extern
void REN__resolve(bool sel, unsigned int AL_index, unsigned int branch_ID, bool correct);

extern
void REN__commit(bool sel, bool &committed, bool &load, bool &store, bool &branch, bool &exception, unsigned int &offending_PC);

extern
void REN__set_exception(bool sel, unsigned int AL_index);
