module down_move(CLK,map,reset, new_block_id, block1_x,block1_y,block2_x,block2_y,block3_x,block3_y,block4_x,block4_y,new_block1_y,new_block2_y,new_block3_y,new_block4_y,new_map,placed,row);
	input reset,CLK;
	input [2:0] block1_x,block2_x,block3_x,block4_x;//生成方塊的x座標
	input [3:0] block1_y,block2_y,block3_y,block4_y;//生成方塊的y座標
	//output reg [2:0] new_block1_x,new_block2_x,new_block3_x,new_block4_x;//移動後方塊的x座標
	output reg [3:0] new_block1_y,new_block2_y,new_block3_y,new_block4_y;//移動後方塊的y座標
	input [127:0] map;// 0為左上角127為右下角
	output reg [127:0] new_map;
	output reg [9:0] row;
	output reg placed;//已無法移動
	
	input [2 : 0] new_block_id; // 新方塊id (from generate_block.v)
	
	always@(posedge CLK or negedge reset)
	begin
		if(!reset)
		begin
//			new_block1_x = 3'd0;
//			new_block2_x = 3'd1;
//			new_block3_x = 3'd2;
//			new_block4_x = 3'd3;
			new_block1_y = 4'd0;
			new_block2_y = 4'd0;
			new_block3_y = 4'd0;
			new_block4_y = 4'd0;
			new_map = 128'b0;
		end
		else if(((block1_y+1) == 16) || ((block2_y+1) == 16) || ((block3_y+1) == 16) || ((block4_y+1) == 16) || ((1<<(block1_x+(block1_y+1)*8)) & map) || ((1<<(block2_x+(block2_y+1)*8)) & map) || ((1<<(block3_x+(block3_y+1)*8)) & map) || ((1<<(block4_x+(block4_y+1)*8)) & map) )
		begin // 撞到不能下降就停
			placed = 1;
			
			// 把現方塊併入地圖
			new_map = (1'b1 << (block1_x + (block1_y)*8)) | (1'b1 << (block2_x + (block2_y)*8)) | (1'b1 << (block3_x + (block3_y)*8)) | (1'b1 << (block4_x + (block4_y)*8)) | map;
						
			//土法煉鋼 判斷消行
			if(new_map[7:0] == 8'b11111111)
			begin
				row = row + 1;
				new_map[15:8] = new_map[7:0];
				new_map[7:0] = 8'b00000000;
			end
			else
				new_map[7:0] = new_map[7:0];
			//===================================	
			if(new_map[15:8] == 8'b11111111)
			begin
				row = row + 1;
				new_map[15:8] = new_map[7:0];
				new_map[7:0] = 8'b00000000;
			end
			else
				new_map[7:0] = new_map[7:0];
			//===================================	
			if(new_map[23:16] == 8'b11111111)
			begin
				row = row + 1;
				new_map[23:8] = new_map[15:0];
				new_map[7:0] = 8'b00000000;
			end
			else
				new_map[7:0] = new_map[7:0];
			//===================================	
			if(new_map[31:24] == 8'b11111111)
			begin
				row = row + 1;
				new_map[31:8] = new_map[23:0];
				new_map[7:0] = 8'b00000000;
			end
			else
				new_map[7:0] = new_map[7:0];
			//===================================	
			if(new_map[39:32] == 8'b11111111)
			begin
				row = row + 1;
				new_map[39:8] = new_map[31:0];
				new_map[7:0] = 8'b00000000;
			end
			else
				new_map[7:0] = new_map[7:0];
			//===================================	
			if(new_map[47:40] == 8'b11111111)
			begin
				row = row + 1;
				new_map[47:8] = new_map[39:0];
				new_map[7:0] = 8'b00000000;
			end
			else
				new_map[7:0] = new_map[7:0];
			//===================================	
			if(new_map[55:48] == 8'b11111111)
			begin
				row = row + 1;
				new_map[55:8] = new_map[47:0];
				new_map[7:0] = 8'b00000000;
			end
			else
				new_map[7:0] = new_map[7:0];
			//===================================
			if(new_map[63:56] == 8'b11111111)
			begin
				row = row + 1;
				new_map[63:8] = new_map[55:0];
				new_map[7:0] = 8'b00000000;
			end
			else
				new_map[7:0] = new_map[7:0];
			//===================================
			if(new_map[71:64] == 8'b11111111)
			begin
				row = row + 1;
				new_map[71:8] = new_map[63:0];
				new_map[7:0] = 8'b00000000;
			end
			else
				new_map[7:0] = new_map[7:0];
			//===================================
			if(new_map[79:72] == 8'b11111111)
			begin
				row = row + 1;
				new_map[79:8] = new_map[71:0];
				new_map[7:0] = 8'b00000000;
			end
			else
				new_map[7:0] = new_map[7:0];
			//===================================	
			if(new_map[87:80] == 8'b11111111)
			begin
				row = row + 1;
				new_map[87:8] = new_map[79:0];
				new_map[7:0] = 8'b00000000;
			end
			else
				new_map[7:0] = new_map[7:0];
			//===================================
			if(new_map[95:88] == 8'b11111111)
			begin
				row = row + 1;
				new_map[95:8] = new_map[87:0];
				new_map[7:0] = 8'b00000000;
			end
			else
				new_map[7:0] = new_map[7:0];
			//===================================
			if(new_map[103:96] == 8'b11111111)
			begin
				row = row + 1;
				new_map[103:8] = new_map[95:0];
				new_map[7:0] = 8'b00000000;
			end
			else
				new_map[7:0] = new_map[7:0];
			//===================================
			if(new_map[111:104] == 8'b11111111)
			begin
				row = row + 1;
				new_map[111:8] = new_map[103:0];
				new_map[7:0] = 8'b00000000;
			end
			else
				new_map[7:0] = new_map[7:0];
			//===================================
			if(new_map[119:112] == 8'b11111111)
			begin
				row = row + 1;
				new_map[119:8] = new_map[111:0];
				new_map[7:0] = 8'b00000000;
			end
			else
				new_map[7:0] = new_map[7:0];
			//===================================
			if(new_map[127:120] == 8'b11111111)
			begin
				row = row + 1;
				new_map[127:8] = new_map[119:0];
				new_map[7:0] = 8'b00000000;
			end
			else
				new_map[7:0] = new_map[7:0];
				
			if(row[4:0] == 5'b01010)
			begin	
				row[4:0] = 5'b00000;
				row = row + 10'b0000100000;	
			end
			else
				row = row;
				
			//new_block等於隨機生成位置，這邊下面先用初始位置測試
			
			case (new_block_id) // 新方塊的y寫在這
				3'd0 : // I
				begin 
					new_block1_y = 4'd0; 
					new_block2_y = 4'd0;
					new_block3_y = 4'd0;
					new_block4_y = 4'd0;
				end
				3'd1 : // O
				begin 
					new_block1_y = 4'd0; 
					new_block2_y = 4'd0;
					new_block3_y = 4'd1;
					new_block4_y = 4'd1;
				end
				3'd2 : // Z
				begin 
					new_block1_y = 4'd0; 
					new_block2_y = 4'd0;
					new_block3_y = 4'd0;
					new_block4_y = 4'd0;
				end
				3'd3 : // S
				begin 
					new_block1_y = 4'd0; 
					new_block2_y = 4'd0;
					new_block3_y = 4'd0;
					new_block4_y = 4'd0;
				end
				3'd4 : // L
				begin 
					new_block1_y = 4'd0; 
					new_block2_y = 4'd0;
					new_block3_y = 4'd0;
					new_block4_y = 4'd0;
				end
				3'd5 : // J
				begin 
					new_block1_y = 4'd0; 
					new_block2_y = 4'd0;
					new_block3_y = 4'd0;
					new_block4_y = 4'd0;
				end
				3'd6 : // T
				begin 
					new_block1_y = 4'd0; 
					new_block2_y = 4'd0;
					new_block3_y = 4'd0;
					new_block4_y = 4'd0;
				end
			endcase
		end
		else
		begin//能下降就下降
			placed = 0;
			new_block1_y = block1_y + 4'b1; 
			new_block2_y = block2_y + 4'b1; 
			new_block3_y = block3_y + 4'b1; 
			new_block4_y = block4_y + 4'b1; 
		end
	end
endmodule
