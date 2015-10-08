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
	vlog divider_even.sv
else 
	echo "divider_even.sv is missing."
	exit
fi

if [ -s "rtl_src/tb_skel.sv" ]; then
	vlog tb_skel.sv
else 
	echo "tb_skel.sv is missing."
	exit
fi


if [ -s "rtl_src/aludofile.do" ]; then
	vsim -novopt -do rtl_src/aludofile.do alu -quiet -c -t 1ps
else 
	echo "aludofile.do is missing."
	exit
fi

if [ -s "syn_alu" ]; then
	design_vision-xg -f syn_alu
fi


