# external clock
create_clock -name {XTL} -period 31250 -waveform {0 15625 } [ get_ports { XTL } ]
create_generated_clock -name {clkout1_} -divide_by 4000 -source [ get_ports { XTL } ] [ get_nets { clkdiv_0/clkout1 } ]
create_generated_clock -name {CLK2} -divide_by 15 -source [ get_ports { XTL } ] [ get_nets { clkdiv_0/clkout2 } ]
create_generated_clock -name {clkout3} -divide_by 16000 -source [ get_ports { XTL } ] [ get_nets { clkdiv_0/clkout3 } ]
