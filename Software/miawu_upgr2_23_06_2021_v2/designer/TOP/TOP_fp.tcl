new_project \
         -name {TOP} \
         -location {F:\SYSTEMS AIDS_18Feb2019\miawu_main_v1_15march19\designer\TOP\TOP_fp} \
         -mode {chain} \
         -connect_programmers {FALSE}
add_actel_device \
         -device {M2GL005} \
         -name {M2GL005}
enable_device \
         -name {M2GL005} \
         -enable {TRUE}
save_project
close_project
