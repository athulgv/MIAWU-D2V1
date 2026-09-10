read_sdc -scenario "place_and_route" -netlist "user" -pin_separator "/" -ignore_errors {F:/SYSTEMS AIDS_18Feb2019/miawu_v18_26march19/designer/TOP/place_route.sdc}
set_options -tdpr_scenario "place_and_route" 
save
set_options -analysis_scenario "place_and_route"
set coverage [report \
    -type     constraints_coverage \
    -format   xml \
    -slacks   no \
    {F:\SYSTEMS AIDS_18Feb2019\miawu_v18_26march19\designer\TOP\TOP_place_and_route_constraint_coverage.xml}]
set reportfile {F:\SYSTEMS AIDS_18Feb2019\miawu_v18_26march19\designer\TOP\coverage_placeandroute}
set fp [open $reportfile w]
puts $fp $coverage
close $fp
