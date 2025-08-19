vlog ../../hdl/tick.v 
vlog ../src/tick_tb.v 

vsim -voptargs=+acc tick_tb
add wave -r *
run -all