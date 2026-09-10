set_device \
    -family  IGLOO2 \
    -die     PA4MGL500 \
    -package tq144 \
    -speed   STD \
    -tempr   {IND} \
    -voltr   {IND}
set_def {VOLTAGE} {1.2}
set_def {VCCI_1.2_VOLTR} {COM}
set_def {VCCI_1.5_VOLTR} {COM}
set_def {VCCI_1.8_VOLTR} {COM}
set_def {VCCI_2.5_VOLTR} {COM}
set_def {VCCI_3.3_VOLTR} {COM}
set_def {RTG4_MITIGATION_ON} {0}
set_def USE_CONSTRAINTS_FLOW 1
set_def NETLIST_TYPE EDIF
set_name TOP
set_workdir {F:\SYSTEMS AIDS_18Feb2019\miawu_v18_26march19\designer\TOP}
set_log     {F:\SYSTEMS AIDS_18Feb2019\miawu_v18_26march19\designer\TOP\TOP_coverage_pr.log}
set_design_state pre_layout
