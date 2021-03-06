#!/bin/bash

echo "Bash script starting"

wget http://web.engr.oregonstate.edu/~traylor/ece474/inclass/wk1/.synopsys_dc.setup


if [ ! -d "work" ]; then
	vlib work
	echo "***** Creating a work directory for Verilog. *****"
fi

if [ -s "fadder.sv" ]; then
	vlog fadder.sv
else 
	echo "fadder.sv is missing."
	exit
fi

if [ -s "adder8.sv" ]; then
	vlog adder8.sv
else 
	echo "adder8.sv is missing."
	exit
fi

if [ -s adder8.do ]; then
	#vsim adder8 -do -quiet -c adder8.do -t 1ps
	vsim -novopt -do adder8.do adder8 -quiet -c -t 1ps
else 
	echo "adder8.do is missing."
	exit
fi

if [ -s "syn_adder8" ]; then
	design_vision-xg -f syn_adder8
fi
name=`cat "work/_info" | grep XOR | wc -m`

if [ 0 -eq $name ]; then
	synop_lib="/nfs/guille/a1/cadlibs/synop_lib/SAED_EDK90nm/Digital_Standard_Cell_Library/verilog"

	echo "***** Compile synthesis library into work *****"
	vlog $synop_lib/*  -work work

fi

if [ -s adder8.gate.v ]; then
	vlog adder8.gate.v
	vsim -novopt -do adder8gate.do adder8 -quiet -c -t 1ps
fi

if [ -s adder8gate.list -a -s adder8.list ]; then
	diff adder8.list adder8gate.list | tee comparison
fi

if [ -a comparison -a ! -s comparison ]; then
	echo "The adder8 and adder8 with gate implementation have the same output, Comparison Success."
else
	echo "The comparison failed the adder8 and adder8.gate with gates have different outputs"
fi

