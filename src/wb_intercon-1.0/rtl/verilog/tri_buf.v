module tri_buf (input in,
	output out,
	input en);
 
assign out = en ? in : 1'bz;
  	  	 
endmodule
