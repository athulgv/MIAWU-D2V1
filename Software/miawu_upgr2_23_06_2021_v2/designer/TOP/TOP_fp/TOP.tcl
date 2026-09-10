open_project -project {E:\MIAWU\03-08-2021\DARIN 2 V1 FPGA SOUCE\Software\miawu_upgr2_23_06_2021_v2\designer\TOP\TOP_fp\TOP.pro}
enable_device -name {M2GL005} -enable 1
set_programming_file -name {M2GL005} -file {E:\MIAWU\03-08-2021\DARIN 2 V1 FPGA SOUCE\Software\miawu_upgr2_23_06_2021_v2\designer\TOP\TOP.ppd}
set_programming_action -action {PROGRAM} -name {M2GL005} 
run_selected_actions
save_project
close_project
