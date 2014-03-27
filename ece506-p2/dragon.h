/*******************************************************
			 dragon.h
		       Ed Gehringer
		    efg@ncsu.edu, 2014
********************************************************/

#ifndef DRAGON_H__
#define DRAGON_H__

class Dragon : public Cache {
	public:
		Dragon(int s, int a, int b, int p ): Cache(s, a, b, p) {};
		~Dragon() { /* insert real code here */ };
		bus_op_t PrRd(ulong addr, int processorNumber);
		bus_op_t PrWr(ulong addr, int processorNumber);
		cacheLine *allocateLine(ulong addr);
		int BusRd(ulong addr);
		int BusUpd(ulong addr);
		int BusRdX(ulong addr) { return 0; };
                int BusUpgr(ulong addr) { return 0;};
};

#endif //DRAGON_H__
