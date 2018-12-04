set projDir "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/planAhead"
set projName "nim"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/mojo_top_0.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/alu_1.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/reset_conditioner_2.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/edge_detector_3.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/edge_detector_3.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/edge_detector_3.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/edge_detector_3.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/edge_detector_3.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/edge_detector_3.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/edge_detector_3.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/edge_detector_3.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/edge_detector_3.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/edge_detector_3.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/button_conditioner_13.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/button_conditioner_13.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/button_conditioner_13.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/button_conditioner_13.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/button_conditioner_13.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/button_conditioner_13.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/button_conditioner_13.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/button_conditioner_13.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/button_conditioner_13.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/button_conditioner_13.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/lfsr_rand_23.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/lfsr_rand_23.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/lfsr_rand_23.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/multi_seven_seg_26.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/led_manager_27.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/bool_28.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/addsub_29.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/comparator_30.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/bitshift_31.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/pipeline_32.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/pipeline_32.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/pipeline_32.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/pipeline_32.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/pipeline_32.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/pipeline_32.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/pipeline_32.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/pipeline_32.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/pipeline_32.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/pipeline_32.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/counter_42.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/seven_seg_43.v" "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/work/verilog/decoder_44.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "/home/ubuntu/Desktop/50002_1D/analog-arcade-50-002/nim/constraint/custom.ucf" "/home/ubuntu/Desktop/Programs/mojo-ide-B1.3.6/library/components/mojo.ucf" "/home/ubuntu/Desktop/Programs/mojo-ide-B1.3.6/library/components/io_shield.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
