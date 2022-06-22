onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/clk_i
add wave -noupdate /testbench/sync_i
add wave -noupdate /testbench/reset_n_i
add wave -noupdate /testbench/adc_data_req_o
add wave -noupdate /testbench/adc_data
add wave -noupdate /testbench/shift_reg
add wave -noupdate /testbench/adc_data_rdy_i
add wave -noupdate /testbench/num
add wave -noupdate /testbench/reset_done
add wave -noupdate /testbench/test_adc_inst/clk_i
add wave -noupdate /testbench/test_adc_inst/reset_n_i
add wave -noupdate /testbench/test_adc_inst/adc_data_req_o
add wave -noupdate /testbench/test_adc_inst/adc_data_rdy_i
add wave -noupdate /testbench/test_adc_inst/adc_data_i
add wave -noupdate /testbench/test_adc_inst/syncro_i
add wave -noupdate /testbench/test_adc_inst/data_o
add wave -noupdate /testbench/test_adc_inst/data_rdy_o
add wave -noupdate /testbench/test_adc_inst/syncro_sr
add wave -noupdate /testbench/test_adc_inst/valid_i
add wave -noupdate /testbench/test_adc_inst/adc_data_req_i
add wave -noupdate /testbench/test_adc_inst/sync_in
add wave -noupdate /testbench/test_adc_inst/adc_data_rdy_z
add wave -noupdate /testbench/test_adc_inst/strb_i
add wave -noupdate /testbench/test_adc_inst/sum
add wave -noupdate /testbench/test_adc_inst/sum_of_total
add wave -noupdate /testbench/test_adc_inst/sum_round
add wave -noupdate /testbench/test_adc_inst/data_shift
add wave -noupdate /testbench/test_adc_inst/i
add wave -noupdate /testbench/test_adc_inst/j
add wave -noupdate /testbench/test_adc_inst/k
add wave -noupdate /testbench/test_adc_inst/r
add wave -noupdate /testbench/test_adc_inst/q
add wave -noupdate -radix sfixed /testbench/test_adc_inst/sum
add wave -noupdate -childformat {{{/testbench/test_adc_inst/data_array[1]} -radix sfixed} {{/testbench/test_adc_inst/data_array[2]} -radix sfixed} {{/testbench/test_adc_inst/data_array[3]} -radix sfixed} {{/testbench/test_adc_inst/data_array[4]} -radix sfixed} {{/testbench/test_adc_inst/data_array[5]} -radix sfixed} {{/testbench/test_adc_inst/data_array[6]} -radix sfixed} {{/testbench/test_adc_inst/data_array[7]} -radix sfixed} {{/testbench/test_adc_inst/data_array[8]} -radix sfixed}} -expand -subitemconfig {{/testbench/test_adc_inst/data_array[1]} {-radix sfixed} {/testbench/test_adc_inst/data_array[2]} {-radix sfixed} {/testbench/test_adc_inst/data_array[3]} {-radix sfixed} {/testbench/test_adc_inst/data_array[4]} {-radix sfixed} {/testbench/test_adc_inst/data_array[5]} {-radix sfixed} {/testbench/test_adc_inst/data_array[6]} {-radix sfixed} {/testbench/test_adc_inst/data_array[7]} {-radix sfixed} {/testbench/test_adc_inst/data_array[8]} {-radix sfixed}} /testbench/test_adc_inst/data_array
add wave -noupdate -childformat {{{/testbench/test_adc_inst/sum_elements_of_array[0]} -radix sfixed} {{/testbench/test_adc_inst/sum_elements_of_array[1]} -radix sfixed} {{/testbench/test_adc_inst/sum_elements_of_array[2]} -radix sfixed} {{/testbench/test_adc_inst/sum_elements_of_array[3]} -radix sfixed}} -expand -subitemconfig {{/testbench/test_adc_inst/sum_elements_of_array[0]} {-radix sfixed} {/testbench/test_adc_inst/sum_elements_of_array[1]} {-radix sfixed} {/testbench/test_adc_inst/sum_elements_of_array[2]} {-radix sfixed} {/testbench/test_adc_inst/sum_elements_of_array[3]} {-radix sfixed}} /testbench/test_adc_inst/sum_elements_of_array
add wave -noupdate -radix sfixed -childformat {{{/testbench/test_adc_inst/sum_of_sum[0]} -radix sfixed} {{/testbench/test_adc_inst/sum_of_sum[1]} -radix sfixed}} -expand -subitemconfig {{/testbench/test_adc_inst/sum_of_sum[0]} {-radix sfixed} {/testbench/test_adc_inst/sum_of_sum[1]} {-radix sfixed}} /testbench/test_adc_inst/sum_of_sum
add wave -noupdate -radix sfixed /testbench/test_adc_inst/sum_of_total
add wave -noupdate /testbench/test_adc_inst/sum_round
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {759896 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {664765 ps} {845235 ps}
