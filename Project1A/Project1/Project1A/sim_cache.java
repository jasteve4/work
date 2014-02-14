import java.io.*;

public class sim_cache { 
    
        static boolean output = true;

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		
	int L1_Blocksize = Integer.parseInt(args[0]);
        int L1_Size = Integer.parseInt(args[1]);
        int L1_Assoc = Integer.parseInt(args[2]);
        int L1_Replacement_Policy = Integer.parseInt(args[3]);
        int L1_Write_Policy = Integer.parseInt(args[4]);
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
        
        if(L1_Write_Policy == 1){
            L1cache.write_policy = true;  
        }
        else{
            L1cache.write_policy = false; 
        }
        L1cache.block_offeset_bits = block_offset_bits;
        L1cache.tag_bits = tag_bits;
        L1cache.index_bits = index_bits;
        L1cache.debug = false;
        L1cache.name = "L1";
        L1cache.output = output; 
        
            
        BufferedReader br = new BufferedReader(new FileReader(trace_file));
        
        
        
        while((line = br.readLine()) != null) {
//        while(iteration < 101) {
//           line = br.readLine(); 
           L1cache.iteration = iteration;
           iteration++;
           if(line.substring(0,1).equals("r")){
               L1cache.state = true;  
            }
            if(line.substring(0,1).equals("w")){
                L1cache.state = false;
            }
            
            
            address = Integer.parseInt(line.substring(2),16);
            
            L1cache.run(address);

        }
      
      double L1_miss_rate = ((L1cache.read_miss_counter + L1cache.write_miss_counter)/(double)(L1cache.read_counter + L1cache.write_counter));
      double L1_cache_hit_time = 0.25 + (2.5*(L1_Size/(double)(512*1024))) + (0.025*(L1_Blocksize/(double)16)) + (0.025*L1_Assoc);
      double L1_miss_penalty = 20 + (0.5*(L1_Blocksize/(double)16));
      double average_access_time = (L1_cache_hit_time + (L1_miss_rate*L1_miss_penalty));

      Output("  ===== Simulator configuration =====");
      Output("  L1_BLOCKSIZE:                    " + L1_Blocksize);
      Output("  L1_SIZE:                         " + L1_Size);
      Output("  L1_ASSOC:                        " + L1_Assoc);
      Output("  L1_REPLACEMENT_POLICY:           " + L1_Replacement_Policy);
      Output("  L1_WRITE_POLICY:                 " + L1_Write_Policy);
      Output("  trace_file:           " + trace_file); 
      Output("  ===================================");
      Output("");
      Output("===== L1 contents =====");
      Output(L1cache.toString());
      Output("  ====== Simulation results (raw) ======");
      Output("  a. number of L1 reads:                " + L1cache.read_counter);
      Output("  b. number of L1 read misses:          " + L1cache.read_miss_counter); 
      Output("  c. number of L1 writes:               " + L1cache.write_counter);
      Output("  d. number of L1 write misses:         " + L1cache.write_miss_counter);
      if(output){
        System.out.printf("  e. L1 miss rate:                     %1$.4f\n", L1_miss_rate);
      }      
      Output("  f. number of writebacks from L1:      " + L1cache.write_back);
      Output("  g. total memory traffic:              " + L1cache.total_memory_traffic_count);
      Output("");  
      Output("  ==== Simulation results (performance) ====");
      if(output){
        System.out.printf("  1. average access time:               %1$.4f ns\n", average_access_time);
      }     
    }

    public static void Output(Object object){
        if(output){
            System.out.println(object);
        }
    }

}
