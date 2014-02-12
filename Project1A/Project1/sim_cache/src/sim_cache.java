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
        
        String line;
        Integer hex;
        String bin;
        String tag;
        String index;
        
        int L1_Sets = (L1_Size/(L1_Assoc*L1_Blocksize));
        Cache L1cache = new Cache(L1_Sets, L1_Assoc);
        

        BufferedReader br = new BufferedReader(new FileReader(trace_file));
        while((line = br.readLine()) != null) {
            
            hex = Integer.parseInt(line.substring(2),16);
            bin = String.format("%32s",Integer.toBinaryString(hex)).replace(' ','0');
            
            int index_bits = (int) (Math.log(L1_Sets)/Math.log(2));
            int block_offset_bits = (int) (Math.log(L1_Blocksize)/Math.log(2));
            int tag_bits = 32 - index_bits - block_offset_bits;
           
            
            if(line.substring(0,1).equals("r")){
                //System.out.println("read");   
            }
            if(line.substring(0,1).equals("w")){
                //System.out.println("write");
            }

        }

    }

}