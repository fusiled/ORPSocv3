/*------------------------------------------------------------------------------
--  a cluster of tri-state buffers
------------------------------------------------------------------------------*/


module tri_state_cluster
	#(
		parameter num_input = 1
	)(
		input [num_input-1:0] in,
		output [num_input-1:0] out,
		input [num_input-1:0] en
	);

genvar i;

generate
	for (i = 0; i < num_input; i=i+1) begin: tri_buf_gen
		tri_buf tri_state_buffer(
			.in (in[i]),
			.out (out[i]),
			.en (en[i])
			);
	end
endgenerate

endmodule