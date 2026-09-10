set_family {IGLOO2}
read_adl {F:\SYSTEMS AIDS_18Feb2019\miawu_v16_21march19\designer\TOP\TOP.adl}
map_netlist
check_constraints {F:\SYSTEMS AIDS_18Feb2019\miawu_v16_21march19\constraint\timing_sdc_errors.log}
write_sdc -strict {F:\SYSTEMS AIDS_18Feb2019\miawu_v16_21march19\designer\TOP\timing_analysis.sdc}
