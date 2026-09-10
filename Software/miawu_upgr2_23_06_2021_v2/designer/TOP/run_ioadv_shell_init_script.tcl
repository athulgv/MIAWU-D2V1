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
set_def {PLL_SUPPLY} {PLL_SUPPLY_25}
set_def USE_CONSTRAINTS_FLOW 1
set_netlist -afl {F:\SYSTEMS AIDS_18Feb2019\MIAWU_MAIN_V2_15MARCH19\designer\TOP\TOP.afl} -adl {F:\SYSTEMS AIDS_18Feb2019\MIAWU_MAIN_V2_15MARCH19\designer\TOP\TOP.adl}
set_constraints   {F:\SYSTEMS AIDS_18Feb2019\MIAWU_MAIN_V2_15MARCH19\designer\TOP\TOP.tcml}
set_placement   {F:\SYSTEMS AIDS_18Feb2019\MIAWU_MAIN_V2_15MARCH19\designer\TOP\TOP.loc}
set_routing     {F:\SYSTEMS AIDS_18Feb2019\MIAWU_MAIN_V2_15MARCH19\designer\TOP\TOP.seg}
