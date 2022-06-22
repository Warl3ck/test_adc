
`timescale 1ps/1ps

module testbench();

parameter clk_period = 10ns; // 100 MHz


bit clk_i;
bit sync_i;
bit reset_n_i;
bit adc_data_req_o;
bit signed [11:0] adc_data;
bit [19:0] shift_reg;
wire adc_data_rdy_i;

integer num = 0;

event reset_done;

always #(clk_period/2) clk_i <= ~clk_i;


	// sync signal
	initial begin
		sync_i = 1'b0;
		@reset_done;
		#50ns
		sync_i = 1'b1;
		#(clk_period)
		sync_i = 1'b0;
		forever begin
			@(adc_data_rdy_i == 0)
				#(clk_period*10);
				sync_i = 1'b1;
				#(clk_period)
				sync_i = 1'b0;
				#(clk_period*15);
				num++;
			if (num == 10) break;
		end	
	end

	
	initial begin
		reset_n_i = 1'b0;
		#500ns
		reset_n_i = 1'b1;
		-> reset_done;
		#5us
		$finish;
	end
	

	always @(posedge clk_i) 
	begin
		shift_reg <= {sync_i, shift_reg[19:1]};
	end


	assign adc_data_rdy_i = shift_reg[0] || shift_reg[1] || shift_reg[2] || shift_reg[3] || shift_reg[4] || shift_reg[5] || shift_reg[6] || shift_reg[7];

	
	always @(posedge clk_i) 
	begin
		if(shift_reg[8:1] > 0) begin
			adc_data <= $random;	
		end	
	end
	

test_adc test_adc_inst (

	.clk_i				(clk_i),
	.reset_n_i			(reset_n_i),
	//ADC interface
	.adc_data_req_o	(adc_data_req_o),
	.adc_data_rdy_i	(adc_data_rdy_i),
	.adc_data_i			(adc_data),
	//Module output interface
	.syncro_i			(sync_i),
	.data_o				(),
	.data_rdy_o			()
);

endmodule