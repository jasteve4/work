# Compilation File for Modelsim

vlog -sv test_arbiter.sv top.sv
vlog arbiter.vp
vsim -novopt top
#log -r /*
run -all
$stop


