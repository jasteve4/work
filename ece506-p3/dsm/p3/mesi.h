/*******************************************************
			 dragon.h
		       Ed Gehringer
		    efg@ncsu.edu, 2014
********************************************************/

#include "cache.h"

class MESI : public Cache {
 public:
  MESI(int s, int a, int b, int p ): Cache(s, a, b, p) {};
  ~MESI() { };
  void PrRd(ulong addr, int processorNumber);
  void PrWr(ulong addr, int processorNumber);
  cacheLine *allocateLine(ulong addr) {return 0;}
  void signalRd(ulong, int) {}
  void signalRdX(ulong, int) {}
  void signalUpgr(ulong, int) {}
  void Int(ulong) {}
  void Inv(ulong) {}
  void notifyCtrl(ulong){}
};

