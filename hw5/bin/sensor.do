add list -nodelta

configure list -strobestart {4 ns}  -strobeperiod {5 ns}
configure list -usestrobe 1

add list -notrigger -hex -width 4  -label LED          LED

add wave *
#add wave /sensor_0/*
#add wave /sensor_0/sr_sm_0/*

force -freeze sim:/top/sensor 0 0
force -freeze sim:/top/clk 1 0, 0 {5ns } -r 10ns
force -freeze sim:/top/clk_mem 1 0, 0 {20ns } -r 40ns

force -freeze sim:/top/reset_n St1 0
run 2ns
force -freeze sim:/top/reset_n 0 0
run 520ns
force -freeze sim:/top/reset_n St1 0
run 2000ns

force -freeze sim:/top/sensor St1 0
run 1000ns
force -freeze sim:/top/sensor St0 0
run 200000ns

force -freeze sim:/top/sensor St1 0
run 1000ns
force -freeze sim:/top/sensor St0 0
run 200000ns

force -freeze sim:/top/sensor St1 0
run 1006ns
force -freeze sim:/top/sensor St0 0
run 200000ns
run 100000ns

write list vectors/sensor.list

quit -f
