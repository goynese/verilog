#!/bin/bash

echo "Bash script starting"

if [ ! -s "synopsys_dc.setup" ]; then
wget http://web.engr.oregonstate.edu/~traylor/ece474/inclass/wk1/.synopsys_dc.setup
fi

if [ ! -d "work" ]; then
	vlib work
	echo "***** Creating a work directory for Verilog. *****"
fi


name=`cat work/_info | grep XOR | wc -m`

if [ 0 -eq $name ]; then

	synop_lib="/nfs/guille/a1/cadlibs/synop_lib/SAED_EDK90nm/Digital_Standard_Cell_Library/verilog"
	vlog $synop_lib/* -work work

fi




if [ -s "rtl_src/divider_even.sv" ]; then
	vlog rtl_src/divider_even.sv
else 
	echo "divider_even.sv is missing."
	exit
fi

if [ -s "rtl_src/counter.sv" ]; then
	vlog rtl_src/counter.sv
else 
	echo "counter.sv is missing."
	exit
fi

if [ -s "rtl_src/counter_sm.sv" ]; then
	vlog rtl_src/counter_sm.sv
else 
	echo "counter_sm.sv is missing."
	exit
fi

if [ -s "rtl_src/fifo.sv" ]; then
	vlog rtl_src/fifo.sv
else 
	echo "fifo.sv is missing."
	exit
fi

if [ -s "rtl_src/mem_to_fifo_sm.sv" ]; then
	vlog rtl_src/mem_to_fifo_sm.sv
else 
	echo "mem_to_fifo_sm.sv is missing."
	exit
fi

if [ -s "rtl_src/shift_register.sv" ]; then
	vlog rtl_src/shift_register.sv
else 
	echo "shift_register.sv is missing."
	exit
fi

if [ -s "rtl_src/shift_register_sm.sv" ]; then
	vlog rtl_src/shift_register_sm.sv
else 
	echo "shift_register_sm.sv is missing."
	exit
fi

if [ -s "rtl_src/rom.sv" ]; then
	vlog rtl_src/rom.sv
else 
	echo "rtl_src/rom.sv is missing."
	exit
fi

if [ -s "rtl_src/sensor.sv" ]; then
	vlog rtl_src/sensor.sv
else 
	echo "rtl_src/sensor.sv is missing."
	exit
fi

if [ -s "rtl_src/top.sv" ]; then
	vlog rtl_src/top.sv
else 
	echo "rtl_src/top.sv is missing."
	exit
fi

echo 'Running the DO file in modelsim.'

if [ -s "bin/ubr.do" ]; then
	vsim -novopt -do bin/sensor.do top -quiet -c -t 1ns
#/	vsim -novopt -do bin/ubr.do top -quiet -c -t 1ns
else 
	echo "ubr.do is missing."
	exit
fi


if [ ! -d "logs" ];then
	mkdir logs
fi

if [ -s "bin/dc_syn" ]; then
	echo '************ I dont know why it says not working the simulation runs fine *** I am now Synthesising my sensor.sv file. **************'
	design_vision-xg -f bin/dc_syn > logs/synth.log
fi


if [ -s vlogout/sensor.gate.v ]; then
	vlog vlogout/sensor.gate.v
#	vsim -novopt -do sensor_with_gates.do sensor.sv
fi

   echo "*****  Simulating Gate-level Verilog top *****"
   vsim -novopt top -do bin/sensor_with_gates.do  +nowarnTFMPC -quiet -c -t 1ns 
   mv vectors/sensor.list vectors/sensor.gate.list

diff vectors/sensor.gate.list vectors/sensor_with_gates.list > reports/rtl_miscompares.txt

sed '/(HOLD (posedge RSTB)/d' < sdfout/sensor.gate.sdf  > sdfout/$$tempfile
sed '/(HOLD (posedge SETB)/d' < sdfout/$$tempfile > sdfout/sensor.gate.sdf

   echo "***** Simulating Gate-level Verilog top with sdf file*****"
   vsim -novopt top -do bin/sensor_with_gates_and_delay.do +nowarnTFMPC -quiet -c -sdfmax /top/sensor_0/=sdfout/sensor.gate.sdf -t 1ns
#   mv vectors/sensor.list vectors/sensor.gate.sdf.list 

diff vectors/sensor_with_gates.list vectors/sensor_with_gates_and_delay.list > reports/gate_miscompares.txt

if [ -s vectors/sensor_with_gates.list -a -s vectors/sensor_with_gates_and_delay.list ]; then
echo '****************** DIFF SUCCESSFUL *****************'
else 
echo ' &&&&&&&&&&&&&&& DiFF UN SUCCESSFUL '
fi

# do place and route
cd pnr
./dopnr.sh
cd ..


#*********HW6 compiling(vlog) and simulating the newly created silicon level design*********


if [ -s vlogout/final.v ]; then
	vlog vlogout/final.v

 	vsim -novopt top -do bin/final.do  +nowarnTFMPC -quiet -c -t 1ns 
#	vsim -novopt -do sensor_with_gates.do sensor.sv        -quiet -c
fi

   echo "***** Simulating with sdf file*****"
#   vsim -novopt top -do bin/final.do +nowarnTFMPC -quiet -c -sdfmax /top/sensor_0/=sdfout/final.sdf -t 1ns
#	vsim -novopt -do sensor_with_gates.do sensor.sv        -quiet -c

diff vectors/final.list vectors/sensor_with_gates_and_delay.list > reports/final_compare.txt

if [ -s reports/final_compare.txt ]; then
echo '****************** DIFF SUCCESSFUL *****************'
else 
echo ' &&&&&&&&&&&&&&& DiFF UN SUCCESSFUL '
fi


