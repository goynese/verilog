#!/bin/bash

echo "Bash script starting"

if [ ! -s "synopsys_dc.setup" ]; then
wget http://web.engr.oregonstate.edu/~traylor/ece474/inclass/wk1/.synopsys_dc.setup
fi

if [ ! -d "work" ]; then
	vlib work
	echo "***** Creating a work directory for Verilog. *****"
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

if [ -s "ubr.do" ]; then
	vsim -novopt -do ubr.do top -t 1ns
#/	vsim -novopt -do ubr.do top -quiet -c -t 1ns
else 
	echo "ubr.do is missing."
	exit
fi


