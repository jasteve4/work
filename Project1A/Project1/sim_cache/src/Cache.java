public class Cache {
	
    cacheEntry[][] tags_matrix = null;
    int assoc;
    int sets;
    public boolean write_policy;
    public int block_offeset_bits;
    public int tag_bits;
    public int index_bits;
    public boolean state;
    public boolean debug;
    public Cache next_cache = null;
    public String name;
    public int iteration;
    public int tag;
    public int index;
    public int write_counter = 0;
    public int write_hit_counter = 0;
    public int write_miss_counter = 0;
    public int read_counter = 0;
    public int read_hit_counter = 0;
    public int read_miss_counter = 0;
    public int address;
    
    public Cache(int sets, int assoc) {
		
        this.assoc = assoc;
        this.sets = sets;
        this.tags_matrix = new cacheEntry[this.sets][this.assoc];
        for(int i = 0; i < this.sets; i++)
        {
            for(int j = 0; j < this.assoc; j++)
            {
                this.tags_matrix[i][j] = new cacheEntry();
                this.tags_matrix[i][j].tag = 0;
                this.tags_matrix[i][j].DirtyBit = false;
                this.tags_matrix[i][j].Address = -1;
            }
        }
		
    }
    
    public void read(){
      
        
	read_counter++;
        if(debug){
            System.out.print("Current set     "+ index + ":     ");
        }    
        for(int J = 0; J < assoc; J++){
            if(debug){
                if(tags_matrix[index][J].Address == -1){
                    System.out.print("-     ");
                }
                else{
                    System.out.print(Integer.toHexString(tags_matrix[index][J].tag));
                    if(tags_matrix[index][J].DirtyBit){
                        System.out.print(" D    ");
                    }
                    else{
                        System.out.print("      ");
                    }
                }
                    
            }
        }
        Debug("");
	for(int J=0; J<assoc; J++){	
            if(tags_matrix[index][J].tag == tag){
		read_hit_counter++;
                Debug(name + " HIT");
                update_LRU(J, index);
                if(debug){
                    System.out.print("Changed set     "+ index + ":     ");
                }
                for(int N = 0; N < assoc; N++){
                    if(debug){
                        if(tags_matrix[index][N].Address == -1){
                            System.out.print("-     ");
                        }
                        else{
                            System.out.print(Integer.toHexString(tags_matrix[index][N].tag)+"     ");
                            if(tags_matrix[index][N].DirtyBit){
                                System.out.print(" D    ");
                            }
                            else{
                                System.out.print("      ");
                            }
                        }
                    
                    }
                }
                Debug("");
                return;
            }
	}
        Debug(name + " MISS");	
        
	read_miss_counter++;
        update_LRU(assoc-1, index);
        tags_matrix[index][0].tag = tag;
        tags_matrix[index][0].Address = this.address;
        if(debug){
            System.out.print("Changed set     "+ index + ":     ");
        }
        for(int N = 0; N < assoc; N++){
            if(debug){
                if(tags_matrix[index][N].Address == -1){
                    System.out.print("-     ");
                }
                else{
                    System.out.print(Integer.toHexString(tags_matrix[index][N].tag)+"     ");
                    if(tags_matrix[index][N].DirtyBit){
                        System.out.print(" D    ");
                    }
                    else{
                        System.out.print("      ");
                    }
                }

            }
        }  
        Debug("");
        return;
    }
	
	public void write(){
        
        
	write_counter++;
        if(debug){
            System.out.print("Current set     "+ index + ":     ");
        }
        for(int N = 0; N < assoc; N++){
            if(debug){
                if(tags_matrix[index][N].Address == -1){
                    System.out.print("-     ");
                }
                else{
                    System.out.print(Integer.toHexString(tags_matrix[index][N].tag)+"     ");
                    if(tags_matrix[index][N].DirtyBit){
                        System.out.print(" D    ");
                    }
                    else{
                        System.out.print("      ");
                    } 
                }

            }
        } 
        Debug("");
	for(int J=0; J < assoc; J++){	
            if(tags_matrix[index][J].Address == -1){
                Debug(name + " MISS");
                write_miss_counter++;
                update_LRU(J, index);
                tags_matrix[index][J].DirtyBit = true;
                tags_matrix[index][J].tag = tag;
                tags_matrix[index][J].Address = this.address;
                Debug(name + " SET DIRTY");
            }
            else if(J == assoc - 1){
                for(int i = 0; i < assoc -1; i ++){
                    if(tags_matrix[index][i].count == assoc-1){
                        Debug(name + " MISS");
                        write_miss_counter++;
                        update_LRU(i, index);
                        tags_matrix[index][i].DirtyBit = true;
                        tags_matrix[index][i].tag = tag;
                        tags_matrix[index][i].Address = this.address;
                        Debug(name + " SET DIRTY");
                    }
                }
            }
            else{
                if(tags_matrix[index][J].tag == tag){
                    Debug(name + " HIT");
                    write_hit_counter++;
                    update_LRU(J, index);
                    Debug(name + " SET DIRTY");
                    tags_matrix[index][J].DirtyBit = true;
                    if(debug){
                        System.out.print("Changed set     "+ index + ":     ");
                    }
                    for(int N = 0; N < assoc; N++){
                        if(debug){
                            if(tags_matrix[index][N].Address == -1){
                                System.out.print("-     ");
                            }
                            else{
                                System.out.print(Integer.toHexString(tags_matrix[index][N].tag)+"     ");
                                if(tags_matrix[index][N].DirtyBit){
                                    System.out.print(" D    ");
                                }
                                else{
                                    System.out.print("      ");
                                }
                            }

                        }
                    }  
                    Debug("");
                    return;
                }
            }
        }
        if(debug){
            System.out.print("Changed set     "+ index + ":     ");
        }
        for(int N = 0; N < assoc; N++){
            if(debug){
                if(tags_matrix[index][N].Address == -1){
                    System.out.print("-     ");
                }
                else{
                    System.out.print(Integer.toHexString(tags_matrix[index][N].tag));
                    if(tags_matrix[index][N].DirtyBit){
                        System.out.print(" D    ");
                    }
                    else{
                        System.out.print("      ");
                    }                    
                    
                    
                    
                }

            }
        }  
        Debug("");
        return;
	
    }
	
	private void update_LRU(int position, int index){
            
            /*cacheEntry temp = tags_matrix[index][position];
            for(int J = position; J > 0; J--){
			    tags_matrix[index][J] = tags_matrix[index][J-1];
            }
            tags_matrix[index][0] = temp;*/
            int min_count = tags_matrix[index][position].count;
            for(int j = 0; j < assoc-1;j++){
                if(j == position){
                    tags_matrix[index][j].count = 0; 
                    continue;
                }
                else if(tags_matrix[index][j].count < min_count){
                    tags_matrix[index][j].count++;
                }
            }
            
            Debug(name + " UPDATE LRU");
		
	}

    public void run(Integer address) {
        
        //String bin = String.format("%32s",Integer.toBinaryString(hex)).replace(' ','0');
        parse(address);
        this.address = address;
        
        if(state)
        {
            Debug("# " + iteration + " : Read "+ Integer.toHexString(address));
            Debug(name + " Read: " + Integer.toHexString(address) + "(tag "+ Integer.toHexString(tag) + ", index " + index + ")" );
            read();
        }
        else
        {
            Debug("# " + iteration + " : Write "+ Integer.toHexString(address));
            Debug(name + " Write: " + Integer.toHexString(address) + "(tag "+ Integer.toHexString(tag) + ", index " + index + ")" );
            write();
        }
    
    
    }
	
    public void Debug(Object object)
    {
        if(debug)
        {
            System.out.println(object);
        }
    }
    
    public void parse(Integer address)
    {
        tag = (address >> (index_bits + block_offeset_bits));
        index = (address >> (block_offeset_bits)) & (int)(Math.pow(2, index_bits) - 1) ;
        //tag = Integer.parseInt(bin.substring(0,tag_bits));
        //index = Integer.parseInt(bin.substring(tag_bits,tag_bits + index_bits));
    }
    
}
