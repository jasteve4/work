
public class Cache {

	public boolean debug = false;
	
	public AssocLevel [] memoryIndex;
	
	public int LRU;
	int STATE = 0;
	int LOC = 1;
	int BLOCKNUMBER = 2;
	int set = 0;
	int assoc = 0;
	int blockSize = 0;
	long tag = 0;
	int index = 0;
	int blockSet = 0;
	int indexBits = 0;
	int blockBits = 0;
	int tagBits = 0;
	String cacheName;
	String debugNumber = new String();
	long instruction = 0;
	int number;
	boolean SBAccess = false;
	int blockNumber = 0;

	
	Cache nextLevel = null;
	
	
	
	
	public int memoryTraffic = 0;
	public int read = 0;
	public int write = 0;
	public int readMiss = 0;
	public int writeMiss = 0;
	public int writeBacks = 0;
	public int SBReadMiss = 0;
	public int SBRead = 0;
	
	
	
	
	
	public Cache(int SetSize, int Assoc, int BlockSize, String name) 
	{
		// TODO Auto-generated constructor stub
		memoryIndex = new AssocLevel[SetSize];
		set = SetSize;
		assoc = Assoc;
		blockSize = BlockSize;
		nextLevel = null;
		indexBits = log2(set);
		blockBits = log2(blockSize);
		tagBits = (int) (32 - indexBits - blockBits);
		cacheName = name;
		
		for(int index = 0; index < SetSize; index++)
		{
			memoryIndex[index] = new AssocLevel(Assoc, BlockSize);
		}
		
	}
		
	
	public int log2(int value)
	{
		return (short)(Math.log10(value)/Math.log10(2));
	}
	
	
	
	public void controler(long[] result) 
	{
		// TODO Auto-generated method stub
		long [] output = new long[2];
		instruction = (result[1] >> blockBits) << blockBits;
		output = processInput(instruction);
		tag = output[0];
		index = (int)output[1];
		if(result[0] == 2)
		{
			result[0] = 0;
			SBAccess = true;
		}
		
		if(result[0] == 0)
		{ 
			read();
		}
		else 
		{ 
			write();
		}
	}
	
	public long [] processInput(long input)
	{
			long [] output = new long[2];
			output[1] = (long)(( input >> blockBits) & ((long)Math.pow(2, indexBits) - 1 ));
			output[0] = (long)(( input >> indexBits + blockBits) & (long)(Math.pow(2, tagBits) - 1 ));	
			return output;
	}
		
	
	private void write() 
	{
		int result;
		long evict;
		int lru;
		long [] input = new long[2];
		write++;
		result = memoryIndex[index].search(tag);
		debugDisplay(cacheName + " write  : " + Long.toHexString(instruction) + "(tag "+ Long.toHexString(tag) +", index "+ index+ ")");
		if(result > -1)
		{
			debugDisplay(cacheName+" write hit");
			memoryIndex[index].write(result);
			debugDisplay(cacheName+ " update LRU");
		}
		else
		{
			debugDisplay(cacheName+ " miss");
			evict = recon();
			if(memoryIndex[index].memorySlot[assoc-1].dirty)
			{
				debugDisplay(cacheName+" victim: " + Long.toHexString(evict));
				writeBacks++;
				if(nextLevel == null)
				{
					memoryTraffic++;
				}
				else
				{
					input[0] = 1;
					input[1] = evict;
					nextLevel.controler(input);
				}
				
			}
			else
			{
				debugDisplay(cacheName+" victim: none");
				
			}
				writeMiss++;	
				if(nextLevel == null)
				{
					memoryTraffic++;
				}
				else
				{
					input[0] = 0;
					input[1] = instruction;
					nextLevel.controler(input);
				}
			lru = memoryIndex[index].findLRU();
			memoryIndex[index].updateMemory(tag, lru);
			debugDisplay(cacheName + " Update LRU");
			memoryIndex[index].writeUpdate();
		}

	}

	
	private void read() 
	{
		int result;
		long evict;
		int lru;
		long [] input = new long[2];
		if(!SBAccess)
			read++;
		else
			SBRead++;
		debugDisplay(cacheName + " read  : " + Long.toHexString(instruction) + "(tag "+ Long.toHexString(tag) +", index "+ index+ ")");
		result = memoryIndex[index].search(tag);
		if(result > -1)
		{
			debugDisplay(cacheName+" read hit");
			memoryIndex[index].read(result);
			debugDisplay(cacheName+ " update LRU");
		}
		else
		{
			debugDisplay(cacheName+ " miss");
			evict = recon();
			if(memoryIndex[index].memorySlot[assoc-1].dirty)
			{
				debugDisplay(cacheName+" victim: " + Long.toHexString(evict));
				writeBacks++;
				if(nextLevel == null)
				{
					memoryTraffic++;
				}
				else
				{
					input[0] = 1;
					input[1] = evict;
					nextLevel.controler(input);
					
				}
				
			}
			else
			{
				debugDisplay(cacheName+" victim: none");
				
			}
				if(!SBAccess)
				{
					readMiss++;
				}
				else
				{
					SBReadMiss++;
				}
				
				if(nextLevel == null)
				{
					memoryTraffic++;
				}
				else
				{
					input[0] = 0;
					input[1] = instruction;
					nextLevel.controler(input);
				}
			lru = memoryIndex[index].findLRU();
			memoryIndex[index].updateMemory(tag, lru);
			debugDisplay(cacheName + " Update LRU");
		}
		SBAccess = false;
	}



	private long recon() 
	{
		// TODO Auto-generated method stub
			return (index << blockBits) + ( memoryIndex[index].memorySlot[assoc-1].tag << (indexBits + blockBits));	
	}
	
	
	public String toString()
	{
		String string = new String();
		for(int i = 0; i < memoryIndex.length; i++)
		{
			string = string + "Set " + i + ":   ";
			string=string + memoryIndex[i].toString();
		}
		return string;
	}

	
	public void debugDisplay(Object object)
	{
		if(debug)
		{
			System.out.println(object);
		}
	}
	
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new Cache(16, 1, 4, "L");
	}

		
}
