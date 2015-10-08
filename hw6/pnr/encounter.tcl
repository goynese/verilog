###################################
# Run the design through Encounter
###################################

source encounter.globals
init_design

# Setup Encounter modes
setPlaceMode -congEffort high
setPlaceMode -placeIoPins false
setPlaceMode -timingDriven true
setDesignMode -process 90

# Create Floorplan

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
set init_verilog ../vlogout/sensor.gate.v
set init_design_netlisttype Verilog
set init_top_cell sensor
set init_design_settop 0
set init_lef_file {/nfs/guille/a1/cadlibs/synop_lib/SAED_EDK90nm/Digital_Standard_Cell_Library/lef/saed90nm_tech.lef /nfs/guille/a1/cadlibs/synop_lib/SAED_EDK90nm/Digital_Standard_Cell_Library/lef/saed90nm.lef }
set init_pwr_net VDD
set init_gnd_net VSS
set init_mmmc_file viewDefinition.tcl
init_design
setPlaceMode -congEffort high
setPlaceMode -placeIoPins false
setPlaceMode -timingDriven true
setDesignMode -process 90
win
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site unit -r 0.957015757316 0.90 10.0 10.0 10.0 10.0
uiSetTool select
getIoFlowFlag
fit

# add VSS/VDD ring on Metal layers 5 (top/bottom) and 6 (left/right)

set sprCreateIeRingNets {}
set sprCreateIeRingLayers {}
set sprCreateIeRingWidth 1.0
set sprCreateIeRingSpacing 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0


# PLACE PINS on Metal layer 3 (ROM/clk_mem connections on left, everyting else on right)

addRing -stacked_via_top_layer M9 -around core -jog_distance 0.16 -threshold 0.16 -nets {VDD VSS} -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 3 -spacing 1
editPin -side Left -use TIEHI -fixOverlap 1 -layer 3 -spreadType start -spacing 2 -start 0.0 0.0 -pin {{ROM_addr[0]} {ROM_addr[1]} {ROM_addr[2]} {ROM_addr[3]} ROM_ce {ROM_data[0]} {ROM_data[1]} {ROM_data[2]} {ROM_data[3]} {ROM_data[4]} {ROM_data[5]} {ROM_data[6]} {ROM_data[7]} ROM_re}
editPin -side Right -fixOverlap 1 -layer 3 -spreadType start -spacing 4 -start 0.0 0.0 -pin {sensor reset_n LED clk_mem clk}
editPin -side Left -use TIEHI -fixOverlap 1 -layer 3 -spreadType start -spacing 2.24 -start 0.0 11.36 -pin {{ROM_data[0]} {ROM_data[1]} {ROM_data[2]} {ROM_data[3]} {ROM_data[4]} {ROM_data[5]} {ROM_data[6]} {ROM_data[7]}}

# route VDD and VSS core power tracks (using sroute)

sroute -connect { blockPin padPin padRing corePin } -layerChangeRange { M1 M9 } -blockPinTarget { nearestRingStripe nearestTarget } -padPinPortConnect { allPort oneGeom } -checkAlignedSecondaryPin 1 -blockPin useLef -allowJogging 1 -crossoverViaBottomLayer M1 -allowLayerChange 1 -targetViaTopLayer M9 -crossoverViaTopLayer M9 -targetViaBottomLayer M1 -nets { VSS VDD }

# Place standard cells

setPlaceMode -fp false
placeDesign -prePlaceOpt

# Create a spare module (with at least 5 cells) and place at least one instance

createSpareModule -moduleName Spare -cell {NAND3X1 1 MUX21X1 1 INVX4 1 FADDX1 1 DFFARX1 1 AOINVX1 1 AND2X1 1}
placeSpareModule -moduleName Spare -numModules 1 -prefix myspare_

# Run global Routing

setNanoRouteMode -quiet -drouteStartIteration default
setNanoRouteMode -quiet -routeTopRoutingLayer default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven false
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign -globalDetail

# Place filler cells (DCAP and SHFILL2)

getFillerMode -quiet
addFiller -cell DCAP SHFILL2 -prefix FILLER


#Verify connectivity

#verifyConnectivity -type all -error 1000 -warning 50 -outDir ../reports/

#Verify Antenna
verifyProcessAntenna -reportfile ../reports/sensor.antenna.rpt -error 1000

#setup Time
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -postRoute -pathReports -drvReports -slackReports -numPaths 50 -prefix setup_time_ -outDir ../reports

#hold time
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -postRoute -hold -pathReports -slackReports -numPaths 50 -prefix cadence_ -outDir ../reports

#power report
set_power_analysis_mode -reset
set_power_analysis_mode -method static -analysis_view my_analysis_view_setup -corner max -create_binary_db false -write_static_currents false -honor_negative_energy true -ignore_control_signals true
set_power_output_dir -reset
set_power_output_dir ../reports
set_default_switching_activity -input_activity 0.2 -period 10.0
read_activity_file -reset
set_power -reset
set_powerup_analysis -reset
set_powerup_analysis -mode accurate -ultrasim_simulation_mode ms
set_dynamic_power_simulation -reset
report_power -rail_analysis_format VS -outfile ../reports/sensor.rpt


# Run Physical Design Rule (RDC) and Connection checks (LVS)
setVerifyGeometryMode -area { 0 0 0 0 } -minWidth false -minSpacing false -minArea false -sameNet false -short true -overlap true -offRGrid false -offMGrid true -mergedMGridCheck true -minHole true -implantCheck true -minimumCut true -minStep true -viaEnclosure true -antenna true -insuffMetalOverlap false -pinInBlkg false -diffCellViol true -sameCellViol false -padFillerCellsOverlap true -routingBlkgPinOverlap true -routingCellBlkgOverlap true -regRoutingOnly false -stackedViasOnRegNet false -wireExt true -useNonDefaultSpacing false -maxWidth true -maxNonPrefLength -1 -error 1000 -warning 50
verifyGeometry
verifyConnectivity -type all -noAntenna

# Output Verilog Netlist
saveNetlist ../vlogout/final.v  -excludeLeafCell -excludeCellInst {DCAP SHFILL2}
# Output DSPF RC Data
write_sdf ../sdfout/final.sdf

saveDesign [format "top.finished.enc"]

win
exit

#@(#)CDS: CPE v11.10-p002


