quietly set ACTELLIBNAME IGLOO2
quietly set PROJECT_DIR "F:/SYSTEMS AIDS/Miawu/UPGRADATION 2/FINAL BACKUP/MIAWU_UPGRADATION2"

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   file delete -force presynth 
   vlib presynth
}
vmap presynth presynth
vmap IGLOO2 "C:/Microsemi/Libero_SoC_v12.3/Designer/lib/modelsimpro/precompiled/vlog/smartfusion2"
vmap SmartFusion2 "C:/Microsemi/Libero_SoC_v12.3/Designer/lib/modelsimpro/precompiled/vlog/smartfusion2"

vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/input_faults.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/stimulus/tb_faul.vhd"

vsim -L IGLOO2 -L presynth  -t 1fs presynth.cfg_tb_fault_input
add wave /tb_fault_input/*
run 1000ns
