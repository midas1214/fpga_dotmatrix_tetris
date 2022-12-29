module generate_block(disabled, random);
	input disabled;
	output [2 : 0] random;
	
	if (disabled)
		random = random; // place 的 first tick 要維持穩定
	else
		assign random = 1; // todo
endmodule
