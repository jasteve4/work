
public class AssocLevel 
{
	public Memory [] memorySlot; 

	public AssocLevel(int assoc, int blockSize) 
	{
		// TODO Auto-generated constructor stub
		memorySlot = new Memory[assoc];
		for(int index = 0; index < assoc; index++)
		{
			memorySlot[index] = new Memory();
			memorySlot[index].memory = new int[blockSize];
			for(int i = 0; i < blockSize; i++)
			{
				memorySlot[index].memory[i] = 0;
			}
		}
	}
	
	public void read(int index)
	{
		Memory temp = memorySlot[index];
		for(int spot = index; spot > 0; spot--)
		{
			memorySlot[spot] = memorySlot[spot-1];
		}	
		memorySlot[0] = temp;
	}
	
	public int search(long tag)
	{
		for(int find = 0; find < memorySlot.length; find++)
		{
			if(tag == memorySlot[find].tag)
			{
				return find;
			}
			if(!memorySlot[find].vaild)
				return -1;
		}
		return -1;	
	}
	
	public int findLRU()
	{
		for(int look = 0; look < memorySlot.length; look++)
			if(!memorySlot[look].vaild)
				return look;
		return memorySlot.length-1;
	}

	
	public void updateMemory(long tag, int lruIndex) 
	{
		// TODO Auto-generated method stub
		Memory temp = memorySlot[lruIndex];
		for(int i = lruIndex; i > 0; i--)
		{
			memorySlot[i] = memorySlot[i -1];
		}
		memorySlot[0] = temp;
		memorySlot[0].tag = tag;
		memorySlot[0].vaild = true;
		memorySlot[0].dirty = false;
	}

	
	public long readUpdate() {
		// TODO Auto-generated method stub
		return memorySlot[0].tag;
	}


	public void write(int tagIndex) 
	{
		// TODO Auto-generated method stub
		Memory temp = memorySlot[tagIndex];
		for(int spot = tagIndex; spot > 0; spot--)
			memorySlot[spot] = memorySlot[spot-1];
		memorySlot[0] = temp;	
		memorySlot[0].dirty = true;
		memorySlot[0].vaild = true;
	}
	
	public void writeUpdate() {
		// TODO Auto-generated method stub
		memorySlot[0].dirty = true;
	}	

	
	public String toString()
	{
		String string = new String();
		for(int i = 0; i < memorySlot.length; i++)
		{
			string = string + Long.toHexString(memorySlot[i].tag);
			if(memorySlot[i].dirty)
				string = string + " D";
			string = string + "    ";
		}
		string = string + "\n";
		return string;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	
}
