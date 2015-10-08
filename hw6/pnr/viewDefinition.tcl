##Required for Encounter 11.1

create_library_set -name my_max_library_set \
	-timing [list /nfs/guille/a1/cadlibs/synop_lib/SAED_EDK90nm/Digital_Standard_Cell_Library/synopsys/models/saed90nm_max.lib]
 
create_library_set -name my_min_library_set \
	-timing [list /nfs/guille/a1/cadlibs/synop_lib/SAED_EDK90nm/Digital_Standard_Cell_Library/synopsys/models/saed90nm_min.lib]

create_constraint_mode -name my_constraint_mode \
	-sdc_files     [list ../sdcout/sensor.gate.sdc]

create_rc_corner -name my_rc_corner_worst\
	-T 				   25

create_delay_corner -name my_delay_corner_max \
	-library_set my_max_library_set \
	-rc_corner   my_rc_corner_worst

create_delay_corner -name my_delay_corner_min \
	-library_set my_min_library_set \
	-rc_corner   my_rc_corner_worst

create_analysis_view -name my_analysis_view_setup \
	-constraint_mode my_constraint_mode \
	-delay_corner    my_delay_corner_max
 
create_analysis_view -name my_analysis_view_hold \
	-constraint_mode my_constraint_mode \
	-delay_corner    my_delay_corner_min

set_analysis_view \
	-setup [list my_analysis_view_setup] \
	-hold  [list my_analysis_view_hold]
