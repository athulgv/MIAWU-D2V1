set_device -family {IGLOO2} -die {M2GL005} -speed {STD}
read_vhdl -mode vhdl_2008 {E:\MIAWU\03-08-2021\DARIN 2 V1 FPGA SOUCE\Software\miawu_upgr2_23_06_2021_v2\component\work\TOP\OSC_0\TOP_OSC_0_OSC.vhd}
read_vhdl -mode vhdl_2008 {E:\MIAWU\03-08-2021\DARIN 2 V1 FPGA SOUCE\Software\miawu_upgr2_23_06_2021_v2\hdl\clv_div.vhd}
read_vhdl -mode vhdl_2008 {E:\MIAWU\03-08-2021\DARIN 2 V1 FPGA SOUCE\Software\miawu_upgr2_23_06_2021_v2\hdl\D_3_23Feb2019.vhd}
read_vhdl -mode vhdl_2008 {E:\MIAWU\03-08-2021\DARIN 2 V1 FPGA SOUCE\Software\miawu_upgr2_23_06_2021_v2\hdl\f1_input.vhd}
read_vhdl -mode vhdl_2008 {E:\MIAWU\03-08-2021\DARIN 2 V1 FPGA SOUCE\Software\miawu_upgr2_23_06_2021_v2\hdl\f3_f4_input.vhd}
read_vhdl -mode vhdl_2008 {E:\MIAWU\03-08-2021\DARIN 2 V1 FPGA SOUCE\Software\miawu_upgr2_23_06_2021_v2\hdl\f9_input.vhd}
read_vhdl -mode vhdl_2008 {E:\MIAWU\03-08-2021\DARIN 2 V1 FPGA SOUCE\Software\miawu_upgr2_23_06_2021_v2\hdl\input_faults.vhd}
read_vhdl -mode vhdl_2008 {E:\MIAWU\03-08-2021\DARIN 2 V1 FPGA SOUCE\Software\miawu_upgr2_23_06_2021_v2\hdl\fault_prss_13march19.vhd}
read_vhdl -mode vhdl_2008 {E:\MIAWU\03-08-2021\DARIN 2 V1 FPGA SOUCE\Software\miawu_upgr2_23_06_2021_v2\hdl\PE_3_23Feb2019.vhd}
read_vhdl -mode vhdl_2008 {E:\MIAWU\03-08-2021\DARIN 2 V1 FPGA SOUCE\Software\miawu_upgr2_23_06_2021_v2\hdl\andgate_1.vhd}
read_vhdl -mode vhdl_2008 {E:\MIAWU\03-08-2021\DARIN 2 V1 FPGA SOUCE\Software\miawu_upgr2_23_06_2021_v2\hdl\stopcom.vhd}
read_vhdl -mode vhdl_2008 {E:\MIAWU\03-08-2021\DARIN 2 V1 FPGA SOUCE\Software\miawu_upgr2_23_06_2021_v2\hdl\D_FF.vhd}
read_vhdl -mode vhdl_2008 {E:\MIAWU\03-08-2021\DARIN 2 V1 FPGA SOUCE\Software\miawu_upgr2_23_06_2021_v2\hdl\switchcheck.vhd}
read_vhdl -mode vhdl_2008 {E:\MIAWU\03-08-2021\DARIN 2 V1 FPGA SOUCE\Software\miawu_upgr2_23_06_2021_v2\hdl\spi.vhd}
read_vhdl -mode vhdl_2008 {E:\MIAWU\03-08-2021\DARIN 2 V1 FPGA SOUCE\Software\miawu_upgr2_23_06_2021_v2\hdl\main_PE_D_3_23Feb2019.vhd}
read_vhdl -mode vhdl_2008 {E:\MIAWU\03-08-2021\DARIN 2 V1 FPGA SOUCE\Software\miawu_upgr2_23_06_2021_v2\component\work\TOP\TOP.vhd}
set_top_level {TOP}
map_netlist
read_sdc {E:\MIAWU\03-08-2021\DARIN 2 V1 FPGA SOUCE\Software\miawu_upgr2_23_06_2021_v2\constraint\user.sdc}
check_constraints {E:\MIAWU\03-08-2021\DARIN 2 V1 FPGA SOUCE\Software\miawu_upgr2_23_06_2021_v2\constraint\synthesis_sdc_errors.log}
write_fdc {E:\MIAWU\03-08-2021\DARIN 2 V1 FPGA SOUCE\Software\miawu_upgr2_23_06_2021_v2\designer\TOP\synthesis.fdc}
