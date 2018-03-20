module acc (enable, data_in, data_out, reset, clk);

input				enable;
input	[31:0]		data_in;
output	[31:0]		data_out;
input				reset;
input				clk;

reg		[31:0]		R_data;
reg					R_enable;
reg		[31:0]		data_out;

always @(posedge clk) begin
	R_enable <= (reset)? 1'b0: enable;
	R_data <= (reset)? 32'h0: data_in;
end

always @(posedge clk) begin
	if (reset)
		data_out <= 32'h0;
	else if (R_enable)
		data_out <= data_out + R_data;
	else
		data_out <= data_out;
end

endmodule




