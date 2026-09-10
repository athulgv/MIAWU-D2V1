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
set_def USE_CONSTRAINTS_FLOW 1
set_name TOP
set_workdir {F:\SYSTEMS AIDS_18Feb2019\miawu_v16_21march19\designer\TOP}
set_design_state post_layout
