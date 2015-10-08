#!/bin/bash

echo "Bash script starting"

if [ ! -d "work" ]; then
	vlib work
	echo "***** Creating a work directory for Verilog. *****"
fi

if [ -s "fadder.sv" -a -s "adder8.sv" ]; then
	vlog fadder.sv
	vlog adder8.sv
else 
	echo "fadder.sv or adder8.sv are missing."
	exit
fi

if [ -s "adder8.do" ]; then
	\\vsim -novopt -t 1ps -do adder8.do adder8
	vsim adder8 -do adder8.do -quiet -c -t 1ps
else 
	echo "adder8.do is missing."
	exit
fi

if [ -s "syn_adder8" ]; then
	design_vision-xg -f syn_adder8
fi

name=`cat work/_info | grep XOR | wc -m`

if [ 0 -eq $name ]; then
	synop_lib="/nfs/guille/a1/cadlibs/synop_lib/SAED_EDK90nm/Digital_Standard_Cell_Library/verilog"
	vlog $synop_lib //-work work
fi

if [ -s sensor.gate.v ]; then
	vlog sensor.gate.v
	vsim -novopt -do bin/ubr.do 
fi
