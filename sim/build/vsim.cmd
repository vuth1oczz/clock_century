vlog ../../hdl/second/tick.v
vlog ../../hdl/second/seconds.v
vlog ../../hdl/top/top.v
vlog ../../hdl/led7/decode.v
vlog ../../hdl/led7/led7seg.v
vlog ../../hdl/minute/minutes.v
vlog ../../hdl/hour/hours.v
vlog ../../hdl/day/days.v
vlog ../../hdl/month/months.v
vlog ../../hdl/year/years.v
vlog ../src/top_tb.v

vsim -voptargs=+acc top_tb
add wave -r *
run -all