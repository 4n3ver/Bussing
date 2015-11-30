transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Bussing-master/Bussing-master/Project3 {D:/Bussing-master/Bussing-master/Project3/ForwardingUnit.v}
vlog -vlog01compat -work work +incdir+D:/Bussing-master/Bussing-master/Project3 {D:/Bussing-master/Bussing-master/Project3/Project2.v}
vlog -vlog01compat -work work +incdir+D:/Bussing-master/Bussing-master/Project3 {D:/Bussing-master/Bussing-master/Project3/SevenSeg.v}
vlog -vlog01compat -work work +incdir+D:/Bussing-master/Bussing-master/Project3 {D:/Bussing-master/Bussing-master/Project3/PLL.v}
vlog -vlog01compat -work work +incdir+D:/Bussing-master/Bussing-master/Project3 {D:/Bussing-master/Bussing-master/Project3/SignExtension.v}
vlog -vlog01compat -work work +incdir+D:/Bussing-master/Bussing-master/Project3 {D:/Bussing-master/Bussing-master/Project3/ALU.v}
vlog -vlog01compat -work work +incdir+D:/Bussing-master/Bussing-master/Project3 {D:/Bussing-master/Bussing-master/Project3/InstMemory.v}
vlog -vlog01compat -work work +incdir+D:/Bussing-master/Bussing-master/Project3 {D:/Bussing-master/Bussing-master/Project3/Mux2to1.v}
vlog -vlog01compat -work work +incdir+D:/Bussing-master/Bussing-master/Project3 {D:/Bussing-master/Bussing-master/Project3/Mux3to1.v}
vlog -vlog01compat -work work +incdir+D:/Bussing-master/Bussing-master/Project3 {D:/Bussing-master/Bussing-master/Project3/PCAdder.v}
vlog -vlog01compat -work work +incdir+D:/Bussing-master/Bussing-master/Project3 {D:/Bussing-master/Bussing-master/Project3/PCIncrement.v}
vlog -vlog01compat -work work +incdir+D:/Bussing-master/Bussing-master/Project3 {D:/Bussing-master/Bussing-master/Project3/Register.v}
vlog -vlog01compat -work work +incdir+D:/Bussing-master/Bussing-master/Project3 {D:/Bussing-master/Bussing-master/Project3/RegisterFile.v}
vlog -vlog01compat -work work +incdir+D:/Bussing-master/Bussing-master/Project3 {D:/Bussing-master/Bussing-master/Project3/SCProcController.v}
vlog -vlog01compat -work work +incdir+D:/Bussing-master/Bussing-master/Project3 {D:/Bussing-master/Bussing-master/Project3/Key.v}
vlog -vlog01compat -work work +incdir+D:/Bussing-master/Bussing-master/Project3 {D:/Bussing-master/Bussing-master/Project3/Switch.v}
vlog -vlog01compat -work work +incdir+D:/Bussing-master/Bussing-master/Project3 {D:/Bussing-master/Bussing-master/Project3/ledrModule.v}
vlog -vlog01compat -work work +incdir+D:/Bussing-master/Bussing-master/Project3 {D:/Bussing-master/Bussing-master/Project3/ledgModule.v}
vlog -vlog01compat -work work +incdir+D:/Bussing-master/Bussing-master/Project3 {D:/Bussing-master/Bussing-master/Project3/hexModule.v}
vlog -vlog01compat -work work +incdir+D:/Bussing-master/Bussing-master/Project3 {D:/Bussing-master/Bussing-master/Project3/DataMem.v}

vlog -vlog01compat -work work +incdir+D:/Bussing-master/Bussing-master/Project3 {D:/Bussing-master/Bussing-master/Project3/ProcTest.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc"  ProcTest

add wave *
view structure
view signals
run -all
