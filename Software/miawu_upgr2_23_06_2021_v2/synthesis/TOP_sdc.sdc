# Written by Synplify Pro version map202309act, Build 044R. Synopsys Run ID: sid1789033697 
# Top Level Design Parameters 

# Clocks 
create_clock -period 31250.000 -waveform {0.000 15625.000} -name {XTL} [get_ports {XTL}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {clkdiv|a2_inferred_clock} [get_pins {clkdiv_0/a2/Q}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {TOP|RDY} [get_ports {RDY}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {clkdiv|a1_inferred_clock} [get_pins {clkdiv_0/a1/Q}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {priority_encoder_8_3|dout_inferred_clock[3]} [get_pins {main_file_0/module_j_inst/dout_inferred_clock_RNO[3]/Y}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {priority_encoder_8_3|pri_enc_un91_din_inferred_clock} [get_pins {main_file_0/module_j_inst/pri_enc.un91_din_inferred_clock_RNO/Y}] 

# Virtual Clocks 

# Generated Clocks 

# Paths Between Clocks 

# Multicycle Constraints 

# Point-to-point Delay Constraints 

# False Path Constraints 

# Output Load Constraints 

# Driving Cell Constraints 

# Input Delay Constraints 

# Output Delay Constraints 

# Wire Loads 

# Other Constraints 

# syn_hier Attributes 

# set_case Attributes 

# Clock Delay Constraints 
set_clock_groups -asynchronous -group [get_clocks {clkdiv|a2_inferred_clock}]
set_clock_groups -asynchronous -group [get_clocks {TOP|RDY}]
set_clock_groups -asynchronous -group [get_clocks {clkdiv|a1_inferred_clock}]
set_clock_groups -asynchronous -group [get_clocks {TOP_OSC_0_OSC|N_XTLOSC_CLKOUT_inferred_clock}]
set_clock_groups -asynchronous -group [get_clocks {priority_encoder_8_3|dout_inferred_clock[3]}]
set_clock_groups -asynchronous -group [get_clocks {priority_encoder_8_3|pri_enc_un91_din_inferred_clock}]

# syn_mode Attributes 

# Cells 

# Port DRC Rules 

# Input Transition Constraints 

# Unused constraints (intentionally commented out) 


# Non-forward-annotatable constraints (intentionally commented out) 

# Block Path constraints 

