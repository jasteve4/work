/*******************************************************
			 dragon.h
		       Ed Gehringer
		    efg@ncsu.edu, 2014
********************************************************/

class Msi_w : public Cache {
 public:
  Msi_w(int s, int a, int b, int p ): Cache(s, a, b, p) {};
  ~Msi_w() { /* insert real code here */};
   bus_op_t PrRd(ulong addr, int processorNumber);
  bus_op_t PrWr(ulong addr, int processorNumber);
  cacheLine *allocateLine(ulong addr);
  int BusRd(ulong addr);
  int BusRdX(ulong addr);
  int BusUpgr(ulong addr);
};

