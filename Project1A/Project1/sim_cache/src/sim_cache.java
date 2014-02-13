import java.io.*;

public class sim_cache { 
    
    
	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		
	int L1_Blocksize = Integer.parseInt(args[0]);
        int L1_Size = Integer.parseInt(args[1]);
        int L1_Assoc = Integer.parseInt(args[2]);
        boolean L1_Replacement_Policy = Boolean.parseBoolean(args[3]);
        boolean L1_Write_Policy = Boolean.parseBoolean(args[4]);
        String trace_file = (args[5]);
        int iteration = 1;
        
        String line;
        Integer address;
        String bin;
        String tag;
        String index;
        
        int L1_Sets = (L1_Size/(L1_Assoc*L1_Blocksize));
        int index_bits = (int) (Math.log(L1_Sets)/Math.log(2));
        int block_offset_bits = (int) (Math.log(L1_Blocksize)/Math.log(2));
        int tag_bits = 32 - index_bits - block_offset_bits;  
            
            
        Cache L1cache = new Cache(L1_Sets, L1_Assoc);
        L1cache.write_policy = L1_Write_Policy;
        L1cache.block_offeset_bits = block_offset_bits;
        L1cache.tag_bits = tag_bits;
        L1cache.index_bits = index_bits;
        L1cache.debug = true;
        L1cache.name = "L1";
        
        
            
        BufferedReader br = new BufferedReader(new FileReader(trace_file));
        
        
        
//        while((line = br.readLine()) != null) {
        while(iteration < 101) {
            
           line = br.readLine();
           L1cache.iteration = iteration;
           iteration++;
           if(line.substring(0,1).equals("r")){
               L1cache.state = true;  
            }
            if(line.substring(0,1).equals("w")){
                L1cache.state = false;
            }
            
            
            address = Integer.parseInt(line.substring(2),16);
            //bin = String.format("%32s",Integer.toBinaryString(hex)).replace(' ','0');
            
            L1cache.run(address);

        }

    }

}