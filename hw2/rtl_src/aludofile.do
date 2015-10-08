  add list -nodelta
  configure list -strobestart {9 ns}  -strobeperiod {10 ns}
  configure list -usestrobe 1

  add list -notrigger -hex -width 16  -label in_a       in_a
  add list -notrigger -hex -width 16 -label in_b        in_b
  add list -notrigger -hex -width 4 -label in_opcode  	in_opcode
  add list -notrigger -hex -width 16  -label out_y	out_y
  add list -notrigger -hex -width 1  -label out_carry   out_carry 
  add list -notrigger -hex -width 1  -label out_zero    out_zero 

	view signals
	add wave -r /*


#	for { set k 1 } { $k <= 12 } { incr k }\
#		{
#			force in_opcode 10#$k
#			for { set i 0 } { $i <= 65536 } { set i [expr {$i +16384}] }\
#			{
#				force in_a 10#$i
#				force in_b 10#$i
#				run 10ns
#			}
#		}

#	Testing the Adder operation

	force in_a  16#FFFF
	force in_b  16#FFFF
	force in_opcode 16#0001
	run 10 ns

	force in_a  16#000F
	force in_b  16#FFFF
	force in_opcode 16#0001
	run 10 ns

	force in_a  16#0000
	force in_b  16#0000
	force in_opcode 16#0001
	run 10 ns

#	Testing the Subtraction operation

	force in_a  16#FFFF
	force in_b  16#FFFF
	force in_opcode 16#0002
	run 10 ns

	force in_a  16#00FF
	force in_b  16#FFFF
	force in_opcode 16#0002
	run 10 ns

	force in_a  16#0000
	force in_b  16#0000
	force in_opcode 16#0002
	run 10 ns

#	Testing the increment operation

	force in_a  16#FFFF
	force in_b  16#FFFF
	force in_opcode 16#0003
	run 10 ns

	force in_a  16#0000
	force in_b  16#FFFF
	force in_opcode 16#0003
	run 10 ns

	force in_a  16#00FF
	force in_b  16#FF00
	force in_opcode 16#0003
	run 10 ns


#	Testing the Decrement operation

	force in_a  16#F0F0
	force in_b  16#0000
	force in_opcode 16#0004
	run 10 ns

	force in_a  16#FFFF
	force in_b  16#FFFF
	force in_opcode 16#0004
	run 10 ns

	force in_a  16#0000
	force in_b  16#FFFF
	force in_opcode 16#0004
	run 10 ns

#	Testing the OR operation

	force in_a  16#FFFF
	force in_b  16#FFFF
	force in_opcode 16#0005
	run 10 ns

	force in_a  16#0F0F
	force in_b  16#F0F0
	force in_opcode 16#0005
	run 10 ns

	force in_a  16#0000
	force in_b  16#F0F0
	force in_opcode 16#0005
	run 10 ns

#	Testing the AND operation

	force in_a  16#FFFF
	force in_b  16#FFFF
	force in_opcode 16#0006
	run 10 ns

	force in_a  16#0F0F
	force in_b  16#FFFF
	force in_opcode 16#0006
	run 10 ns

	force in_a  16#0000
	force in_b  16#0000
	force in_opcode 16#0006
	run 10 ns

#	Testing the XOR operation

	force in_a  16#FF0F
	force in_b  16#0FFF
	force in_opcode 16#0007
	run 10 ns

	force in_a  16#FFFF
	force in_b  16#FFFF
	force in_opcode 16#0007
	run 10 ns

	force in_a  16#0000
	force in_b  16#0000
	force in_opcode 16#0007
	run 10 ns

#	Testing the shift one place right operation

	force in_a  16#FFFF
	force in_b  16#FFFF
	force in_opcode 16#0008
	run 10 ns

	force in_a  16#0000
	force in_b  16#FFFF
	force in_opcode 16#0008
	run 10 ns

	force in_a  16#0FF0
	force in_b  16#FFFF
	force in_opcode 16#0008
	run 10 ns

#	Testing the shipt one place left operation

	force in_a  16#FFFF
	force in_b  16#FFFF
	force in_opcode 16#0009
	run 10 ns

	force in_a  16#FFFF
	force in_b  16#F0F0
	force in_opcode 16#0009
	run 10 ns

	force in_a  16#0000
	force in_b  16#0000
	force in_opcode 16#0009
	run 10 ns

#	Testing the ones comp operation

	force in_a  16#FFFF
	force in_b  16#FFFF
	force in_opcode 16#000A
	run 10 ns

	force in_a  16#0000
	force in_b  16#FFFF
	force in_opcode 16#000A
	run 10 ns

	force in_a  16#FFFF
	force in_b  16#F0F0
	force in_opcode 16#000A
	run 10 ns

#	Testing the twos comp operation

	force in_a  16#FFFF
	force in_b  16#FFFF
	force in_opcode 16#000B
	run 10 ns

	force in_a  16#F0F0
	force in_b  16#FFFF
	force in_opcode 16#000B
	run 10 ns

	force in_a  16#0000
	force in_b  16#FFFF
	force in_opcode 16#000B
	run 10 ns

#	Testing BAD opcodes

	force in_a  16#FFFF
	force in_b  16#FFFF
	force in_opcode 16#000C
	run 10 ns

	force in_a  16#F0F0
	force in_b  16#FFFF
	force in_opcode 16#00CB
	run 10 ns

	force in_a  16#0000
	force in_b  16#FFFF
	force in_opcode 16#0000
	run 10 ns

#	Testing X in X out opcodes

	force in_a  16#FxFF
	force in_b  16#FFFF
	force in_opcode 16#0001
	run 10 ns

	force in_a  16#FxFx
	force in_b  16#FxFx
	force in_opcode 16#0002
	run 10 ns

	force in_a  16#0000
	force in_b  16#xxxx
	force in_opcode 16#0000
	run 10 ns

	write list alu.list

	quit -f
