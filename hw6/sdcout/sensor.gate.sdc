###################################################################

# Created by write_sdc on Sun Jun  9 22:28:27 2013

###################################################################
set sdc_version 1.9

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA
set_operating_conditions TYPICAL -library saed90nm_typ
set_wire_load_mode top
set_wire_load_model -name 8000 -library saed90nm_typ
set_driving_cell -lib_cell SDFFARX1 [get_ports reset_n]
set_driving_cell -lib_cell SDFFARX1 [get_ports sensor]
set_driving_cell -lib_cell SDFFARX1 [get_ports {ROM_data[7]}]
set_driving_cell -lib_cell SDFFARX1 [get_ports {ROM_data[6]}]
set_driving_cell -lib_cell SDFFARX1 [get_ports {ROM_data[5]}]
set_driving_cell -lib_cell SDFFARX1 [get_ports {ROM_data[4]}]
set_driving_cell -lib_cell SDFFARX1 [get_ports {ROM_data[3]}]
set_driving_cell -lib_cell SDFFARX1 [get_ports {ROM_data[2]}]
set_driving_cell -lib_cell SDFFARX1 [get_ports {ROM_data[1]}]
set_driving_cell -lib_cell SDFFARX1 [get_ports {ROM_data[0]}]
set_load -pin_load 0.00685 [get_ports {ROM_addr[3]}]
set_load -pin_load 0.00685 [get_ports {ROM_addr[2]}]
set_load -pin_load 0.00685 [get_ports {ROM_addr[1]}]
set_load -pin_load 0.00685 [get_ports {ROM_addr[0]}]
set_load -pin_load 0.00685 [get_ports ROM_re]
set_load -pin_load 0.00685 [get_ports ROM_ce]
set_load -pin_load 0.00685 [get_ports LED]
create_clock [get_ports clk]  -period 10  -waveform {0 5}
set_clock_uncertainty -setup 0.01  [get_clocks clk]
set_clock_uncertainty -hold 0.02  [get_clocks clk]
create_clock [get_ports clk_mem]  -period 40  -waveform {0 20}
set_clock_uncertainty 0.02  [get_clocks clk_mem]
set_input_delay -clock clk_mem  -min 1  [get_ports {ROM_data[7]}]
set_input_delay -clock clk  -max 1  -add_delay  [get_ports {ROM_data[7]}]
set_input_delay -clock clk_mem  -min 1  [get_ports {ROM_data[6]}]
set_input_delay -clock clk  -max 1  -add_delay  [get_ports {ROM_data[6]}]
set_input_delay -clock clk_mem  -min 1  [get_ports {ROM_data[5]}]
set_input_delay -clock clk  -max 1  -add_delay  [get_ports {ROM_data[5]}]
set_input_delay -clock clk_mem  -min 1  [get_ports {ROM_data[4]}]
set_input_delay -clock clk  -max 1  -add_delay  [get_ports {ROM_data[4]}]
set_input_delay -clock clk_mem  -min 1  [get_ports {ROM_data[3]}]
set_input_delay -clock clk  -max 1  -add_delay  [get_ports {ROM_data[3]}]
set_input_delay -clock clk_mem  -min 1  [get_ports {ROM_data[2]}]
set_input_delay -clock clk  -max 1  -add_delay  [get_ports {ROM_data[2]}]
set_input_delay -clock clk_mem  -min 1  [get_ports {ROM_data[1]}]
set_input_delay -clock clk  -max 1  -add_delay  [get_ports {ROM_data[1]}]
set_input_delay -clock clk_mem  -min 1  [get_ports {ROM_data[0]}]
set_input_delay -clock clk  -max 1  -add_delay  [get_ports {ROM_data[0]}]
set_output_delay -clock clk_mem  -max 0.15  [get_ports {ROM_addr[3]}]
set_output_delay -clock clk_mem  -max 0.15  [get_ports {ROM_addr[2]}]
set_output_delay -clock clk_mem  -max 0.15  [get_ports {ROM_addr[1]}]
set_output_delay -clock clk_mem  -max 0.15  [get_ports {ROM_addr[0]}]
set_output_delay -clock clk_mem  -max 0.15  [get_ports ROM_re]
set_output_delay -clock clk_mem  -max 0.15  [get_ports ROM_ce]
set_output_delay -clock clk  -max 1  [get_ports LED]
