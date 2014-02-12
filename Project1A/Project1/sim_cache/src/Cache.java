public class Cache {
	
    String[][] tags_matrix = null;
    int assoc;
    int sets;

    public Cache(int sets, int assoc) {
		
        this.assoc = assoc;
        this.sets = sets;
        tags_matrix = new String[this.sets][this.assoc];
		
    }
	
    public void read(String bin, int index_bits, int tag_bits){
        
        int read_counter = 0;
        int read_hit_counter = 0;
        int read_miss_counter = 0;
        
        String tag = bin.substring(0,tag_bits);
        int index = Integer.parseInt(bin.substring(tag_bits,tag_bits + index_bits));
        
	read_counter++;
	for(int J=0; J<assoc; J++){	
            if(tags_matrix[index][J] == tag){
		read_hit_counter++;
                update(J, index, tag);
                return;
            }
	}
		
	read_miss_counter++;
	for(int J=0; J<assoc; J++){
            update(assoc-1, index, tag);
            return;
	}
    }
	
	public void write(String bin, int index_bits, int tag_bits){
        
        int write_counter = 0;
        int write_hit_counter = 0;
        int write_miss_counter = 0;
        
        String tag = bin.substring(0,tag_bits);
        int index = Integer.parseInt(bin.substring(tag_bits,tag_bits + index_bits));
        
	write_counter++;
	for(int J=0; J<assoc; J++){	
            if(tags_matrix[index][J] == tag){
		write_hit_counter++;
                update(J, index, tag);
                return;
            }
	}
		
	write_miss_counter++;
	for(int J=0; J<assoc; J++){
            update(assoc-1, index, tag);
            return;
	}
    }
	
	private void update(int position, int index, String tag){
		
		for(int J=0; J<position; J++){
			tags_matrix[index][position-J] = tags_matrix[index][position-J-1];  //right shift matrix	
		}
		tags_matrix[index][0] = tag;
	}
	
}
