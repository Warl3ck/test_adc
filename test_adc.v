`timescale 1ns / 1ps


module test_adc(
	input 			clk_i,
	input 			reset_n_i,

//ADC interface
	output			adc_data_req_o,
	input				adc_data_rdy_i,
	input [11:0] 	adc_data_i,
	
//Module output interface
	input				syncro_i,
	output [11:0]	data_o,
	output 			data_rdy_o
);

	reg [10:0] syncro_sr;
	reg [7:0] valid_i;
	reg adc_data_req_i;
	reg sync_in;
	reg adc_data_rdy_z;
	wire strb_i;
	reg latch_strb;
	reg signed [11:0] data_array [0:8];
	reg signed [12:0] sum_elements_of_array [0:3];
	reg signed [12:0] sum_of_sum[0:1];
	reg signed [12:0] sum_of_total;
	reg [11:0] data_shift;
	
	integer i,j,k,r;
	
	// recieve async input signal syncro_i
	always @(posedge clk_i or negedge reset_n_i or posedge syncro_i)
	begin
		if (!reset_n_i)
			sync_in <= 1'b0;
		else if (syncro_i)
			sync_in <= 1'b1;
		else
			sync_in <= syncro_i;
	end
	
	// delay syncro_i on 11 time
	always @(posedge clk_i or negedge reset_n_i)
	begin
		if (!reset_n_i)
			syncro_sr <= {11{1'b0}};
		else
			syncro_sr <= {syncro_i, syncro_sr[10:1]};
	end
	
	
	// create signal enable for ADC 8 time
	always @(posedge clk_i or negedge reset_n_i)
	begin
		if (!reset_n_i)
			valid_i <= {8{1'b0}};
		else 
			valid_i <= {syncro_sr[0], valid_i[7:1]};
	end
	

	always @(posedge clk_i or negedge reset_n_i)
	begin
		if (!reset_n_i) begin
			for (i = 0; i < 8; i = i + 1) begin
				data_array[i] <= {12{1'b0}};
			end	
		end else if (adc_data_rdy_i) begin
				data_array[0] = adc_data_i;
				for (i = 0; i < 8; i = i + 1) begin
					data_array[i+1] <= data_array[i];
			end
		end
	end

	
	// sum of even and odd
	always @(*)
	begin
		if (!reset_n_i) begin
			for (k = 1; k < 8; k = k + 2) begin
				sum_elements_of_array[k/2] <= 13'h0;
			end	
		end else begin
			for (k = 1; k < 8; k = k + 2) begin
				sum_elements_of_array[k/2] = data_array[k] + data_array[k+1];
				
			end	
		end	
	end
	

	//sum of sum 
	always @(*)
	begin
		for (j = 1; j < 4; j = j + 2) begin
			sum_of_sum[j/2] = sum_elements_of_array[j-1][12:1] + sum_elements_of_array[j][12:1];
		end		
	end
	
	
	always @(*)
	begin
		sum_of_total = sum_of_sum[0][12:1] + sum_of_sum[1][12:1];
	end	
	
	
	always @(posedge clk_i or negedge reset_n_i)
	begin
		if (!reset_n_i)
			data_shift <= {12{1'b0}};
		else if (strb_i)
			data_shift <= (sum_of_total) >> 3;
	end		
	
	
	// strob	valid data
	always @(posedge clk_i or negedge reset_n_i)
	begin
		if (!reset_n_i) 
			adc_data_rdy_z <= 1'b0;
		else
			adc_data_rdy_z <= adc_data_rdy_i;
	end
	
	assign strb_i = adc_data_rdy_z && (!adc_data_rdy_i);
	
	always @(posedge clk_i or negedge reset_n_i)
	begin
		if (!reset_n_i)
			latch_strb <= 1'b0;
		else if (strb_i)
			latch_strb <= 1'b1;
	end		
	
	
	always @(*)
	begin
		adc_data_req_i = 1'b0;
		for (r = 0; r < 8; r = r + 1) begin
			adc_data_req_i = adc_data_req_i || valid_i[r]; 	
		end	
	end
	
	
	assign adc_data_req_o = adc_data_req_i;
	assign data_rdy_o = latch_strb;
	assign data_o = data_shift;
	
	
endmodule	