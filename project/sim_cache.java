import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;
import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;


public class sim_cache{
	
	public boolean debug = false;
	
	public boolean vcc = false;
	public String vccAddress = new String();
	
	public Cache [4] proccessArray;
	
	public int blockSize;
	public int cacheSize;
	public int cacheAssoc;
	public String fileName;
	
	
	public int cacheSet;
	public long cacheTag;
	public int cacheIndexBits;
	public int blockBits;
	public int cacheTagBits;
	
	
	public boolean enableL2 = false;
	public int INDEX = 1;
	public int TAG = 0;
	public int BLOCKOFFSET = 2; 
	
	
	public 	ArrayList<String> fileMemory = new ArrayList<String>();
	public long fileMemorySize;
	
	public int cacheReads = 0;
	public int cacheWrites = 0;
	public int cacheReadHits = 0;
	public int cacheWriteHits = 0;
	public int cacheReadMisses = 0;
	public int cacheWriteMisses = 0;
	public int cacheWriteBacks = 0;
	
	
	
	public long memoryTraff = 0;
	public int currentPrefechBlock = 0;
	
	
	

	public sim_cache(String BlockSize, String Size, String Assoc, String FileName) 
	{
		// TODO Auto-generated constructor stub
		blockSize = Integer.valueOf(BlockSize);
		cacheSize = Integer.valueOf(Size);
		cacheAssoc = Integer.valueOf(Assoc);
		fileName = FileName;	
		
		
		cacheInit();
		loadTextFile();
		startProgram();
		displayResults();
		
	}

	public double round6(double to) {
		// TODO Auto-generated method stub
		BigDecimal big = BigDecimal.valueOf(to);
		big = big.movePointRight(6);
		big = big.setScale(0, RoundingMode.HALF_UP);
		big = big.movePointLeft(6);
		
		return big.doubleValue();
	}
	
	private void displayResults() 
	{

		display("===== Simulator configuration =====");
		display("BLOCKSIZE:		"+ blockSize);
		display("L1_SIZE:		"+ cacheSize);
		display("L1_ASSOC: 		"+ cacheAssoc);
		display("trace_file:	" + fileName);
		
	}









	public void display(Object output)
	{
		System.out.println(output);
	}
	
	public void cacheInit()
	{	
		
		cacheSet = cacheSize/(cacheAssoc*blockSize);
		cacheTag = (long)Math.pow(2, cacheTagBits);
		for(int i = 0; i < 4 ; i++)
		proccessArray[i] = new Cache(cacheSet, cacheAssoc, blockSize, "L" + i);
	}
	
	
	public void loadTextFile()
	{
		try 
		{
		Scanner input = new Scanner(new File(fileName));

		       String line = input.nextLine();
		       while(input.hasNext())
		       {
				fileMemory.add(line);
		       	line = input.nextLine();
		       }
		       fileMemory.add(line);
		       input.close();
		}
		catch (IOException e) 
		{
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
	fileMemorySize = fileMemory.size();		
		
	}	
	
	public void startProgram()
	{
		int fileIndex = 0;
		long [] result = new long[2];
		while(fileIndex <  fileMemorySize)
		{

			result = parseInput(fileMemory.get(fileIndex));
			fileIndex++;
		}
	}

	
	public long [] parseInput(String inputString)
	{
		String value = inputString.substring(2);
		long [] output = new long[2];
		output[1] = Long.parseLong(value, 16);
		if(inputString.startsWith("r"))
			output[0] = 0;															// 0 is a read
		else if(inputString.startsWith("w"))
			output[0] = 1;															// 1 is a write
		return output;		
	}
		
	
	/**
	 * @param args
	 */
	public static void main(String[] args) 
	{
		// TODO Auto-generated method stub
		new sim_cache(args[0],args[1], args[2], args[3]);
	}

}
