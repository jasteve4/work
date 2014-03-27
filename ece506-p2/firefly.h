/*******************************************************
			 firefly.h
		       Ryan Clarke
		    rkclarke@ncsu.edu, 2014
********************************************************/

#ifndef FIREFLY_H__
#define FIREFLY_H__

class Firefly : public Cache {
	public:
		Firefly(int s, int a, int b, int p ): Cache(s, a, b, p) {};
		~Firefly() { /* insert real code here */};
		bus_op_t PrRd(ulong addr, int processorNumber);
		bus_op_t PrWr(ulong addr, int processorNumber);
		cacheLine *allocateLine(ulong addr);
		int BusRd(ulong addr);
		int BusUpd(ulong addr);
		int BusRdX(ulong addr) { return 0;};
                int BusUpgr(ulong addr) { return 0;};
};

#endif //FIREFLY_H__
