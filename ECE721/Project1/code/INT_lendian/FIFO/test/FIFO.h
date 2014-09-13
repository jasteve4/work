

using namespace std;

	/////////////////////////////////////////////////////////////////////
	// Structure 3: Free List
	//
	// Entry contains: physical register number
	//
	// Notes:
	// * Structure includes head, tail, and possibly other variables
	//   depending on your implementation.
	/////////////////////////////////////////////////////////////////////

class FreeList
{
  public:
    unsigned int        physical_reg;    
                        FreeList();
};


	/////////////////////////////////////////////////////////////////////
	// Structure 4: Active List
	//
	// Entry contains:
	// 1. destination flag (indicates whether or not the instr. has a
	//    destination register)
	// 2. logical register number of the instruction's destination
	// 3. physical register number of the instruction's destination
	// 4. completed bit
	// 5. exception bit
	// 6. load flag (indicates whether or not the instr. is a load)
	// 7. store flag (indicates whether or not the instr. is a store)
	// 8. branch flag (indicates whether or not the instr. is a branch)
	// 9. program counter of the instruction
	//
	// Notes:
	// * Structure includes head, tail, and possibly other variables
	//   depending on your implementation.
	/////////////////////////////////////////////////////////////////////

class ActiveList
{

  public:
    bool                dest_flag;
    unsigned int        physical_reg;    
    unsigned int        logical_reg;
    bool                completed_bit;
    bool                excepiton_bit;
    bool                load_flag ;
    bool                store_flag ;
    bool                branch_flag;
    unsigned long long  program_counter;
                        ActiveList();
    void                Reset();
};


class FreeFIFO
{
  public:

    unsigned int        head_pointer, tail_pointer, size, entry_count;
    bool                empty, full;
    FreeList            *entry;
                        FreeFIFO (unsigned int);
    unsigned int        Pop();
    void                Push(unsigned int);
    unsigned int        Walk_Back();
    void                Walk_Forward();
    void                Reset_Head();
    void                Reset_Tail();

};


class ActiveFIFO
{
  public:

    unsigned int        head_pointer, tail_pointer, size, entry_count;
    bool                empty, full;
    ActiveList          *entry;
                        ActiveFIFO();
                        ActiveFIFO (unsigned int);
    unsigned int        Pop();
    void                Push(unsigned int);
    unsigned int        Walk_Back();
    void                Walk_Forward();
    void                Reset_Head();
    void                Reset_Tail();

};



class BranchCheckPoint
{

  public:
                        BranchCheckPoint();
                        BranchCheckPoint(int);
    unsigned int        *SMT;
    unsigned int        checkpoint_FL_head_index; 
    unsigned long long  checkpoint_GMB;
};


class test
{
  private:
    FreeFIFO *free_list;
  
  public:
    test();
};
