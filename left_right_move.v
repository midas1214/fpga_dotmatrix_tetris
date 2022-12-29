module left_right_move(CLK, left_button, right_button, map, placed, new_block_id, block1_y, block2_y, block3_y, block4_y, next_block1_x,next_block2_x,next_block3_x,next_block4_x);
	input CLK, placed;
	input right_button, left_button;
	input [2 : 0] new_block_id;
	input [127:0] map;
	input [3:0] block1_y,block2_y,block3_y,block4_y;//現在方塊的y座標
	output reg [2:0] next_block1_x,next_block2_x,next_block3_x,next_block4_x;//下落方塊的x座標
	initial 
	begin
		next_block1_x = 3'd0;
		next_block2_x = 3'd1;
		next_block3_x = 3'd2;
		next_block4_x = 3'd3;
   end
	//output reg [2:0] new_next_block1_x,new_next_block2_x,new_next_block3_x,new_next_block4_x;//下落方塊的x座標
	always@(posedge CLK)
	begin
		if(placed)
		begin
			case (new_block_id) // 新方塊的x寫在這
				3'd0 : // I
				begin 
					next_block1_x <= 3'd0;
					next_block2_x <= 3'd1;
					next_block3_x <= 3'd2;
					next_block4_x <= 3'd3;
				end
				3'd1 : // O
				begin 
					next_block1_x <= 3'd0;
					next_block2_x <= 3'd1;
					next_block3_x <= 3'd1;
					next_block4_x <= 3'd0;
				end
				3'd2 : // Z
				begin 
					next_block1_x <= 3'd0;
					next_block2_x <= 3'd1;
					next_block3_x <= 3'd2;
					next_block4_x <= 3'd3;
				end
				3'd3 : // S
				begin 
					next_block1_x <= 3'd0;
					next_block2_x <= 3'd1;
					next_block3_x <= 3'd2;
					next_block4_x <= 3'd3;
				end
				3'd4 : // L
				begin 
					next_block1_x <= 3'd0;
					next_block2_x <= 3'd1;
					next_block3_x <= 3'd2;
					next_block4_x <= 3'd3;
				end
				3'd5 : // J
				begin 
					next_block1_x <= 3'd0;
					next_block2_x <= 3'd1;
					next_block3_x <= 3'd2;
					next_block4_x <= 3'd3;
				end
				3'd6 : // T
				begin 
					next_block1_x <= 3'd0;
					next_block2_x <= 3'd1;
					next_block3_x <= 3'd2;
					next_block4_x <= 3'd3;
				end
			endcase
		end
		else if (right_button)
		begin 
			if (next_block1_x == 7 || next_block2_x == 7 || next_block3_x == 7 || next_block4_x == 7) //碰右牆
			begin
				next_block1_x <= next_block1_x;
				next_block2_x <= next_block2_x;
				next_block3_x <= next_block3_x;
				next_block4_x <= next_block4_x;
			end
			else if (map[next_block1_x + (block1_y)*8 + 1] || map[next_block2_x + (block2_y)*8 + 1] || map[next_block3_x + (block3_y)*8 + 1] || map[next_block4_x + (block4_y)*8 + 1])
			begin
				next_block1_x <= next_block1_x;
				next_block2_x <= next_block2_x;
				next_block3_x <= next_block3_x;
				next_block4_x <= next_block4_x;
			end
			else 
			begin
				next_block1_x <= next_block1_x + 1;
				next_block2_x <= next_block2_x + 1;
				next_block3_x <= next_block3_x + 1;
				next_block4_x <= next_block4_x + 1;
			end
		end
		else if (left_button)
		begin 
			if (next_block1_x == 0 || next_block2_x == 0 || next_block3_x == 0 || next_block4_x == 0) //碰左牆
			begin
				next_block1_x <= next_block1_x;
				next_block2_x <= next_block2_x;
				next_block3_x <= next_block3_x;
				next_block4_x <= next_block4_x;
			end 
			else if (map[next_block1_x + (block1_y)*8 - 1] || map[next_block2_x + (block2_y)*8 - 1] || map[next_block3_x + (block3_y)*8 - 1] || map[next_block4_x + (block4_y)*8 - 1])
			begin
				next_block1_x <= next_block1_x;
				next_block2_x <= next_block2_x;
				next_block3_x <= next_block3_x;
				next_block4_x <= next_block4_x;
			end
			else 
			begin
				next_block1_x <= next_block1_x - 1;
				next_block2_x <= next_block2_x - 1;
				next_block3_x <= next_block3_x - 1;
				next_block4_x <= next_block4_x - 1;
			end
		end
		else
		begin
			next_block1_x <= next_block1_x;
			next_block2_x <= next_block2_x;
			next_block3_x <= next_block3_x;
			next_block4_x <= next_block4_x;
		end
	end
endmodule 