set_family {IGLOO2}
read_vhdl -mode vhdl_2008 {F:\SYSTEMS AIDS_18Feb2019\miawu_main_v1_15march19\hdl\andgate_1.vhd}
set_top_level {ANDgate_1}
map_netlist
check_constraints {F:\SYSTEMS AIDS_18Feb2019\miawu_main_v1_15march19\constraint\synthesis_sdc_errors.log}
write_fdc {F:\SYSTEMS AIDS_18Feb2019\miawu_main_v1_15march19\designer\ANDgate_1\synthesis.fdc}
