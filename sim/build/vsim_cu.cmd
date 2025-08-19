vlog ../../hdl/bcd_encode.v 
vlog ../src/encode_bcd_tb.v 

vsim -voptargs=+acc bcd_encode_tb
add wave -r *
run -all