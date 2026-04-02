## Clock
set_property PACKAGE_PIN E3 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.0 [get_ports clk]

## Reset button
set_property PACKAGE_PIN D9 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]

## LEDs (6 used)
set_property PACKAGE_PIN H5  [get_ports {led[0]}]
set_property PACKAGE_PIN J5  [get_ports {led[1]}]
set_property PACKAGE_PIN T9  [get_ports {led[2]}]
set_property PACKAGE_PIN T10 [get_ports {led[3]}]
set_property PACKAGE_PIN H6  [get_ports {led[4]}]
set_property PACKAGE_PIN K6  [get_ports {led[5]}]

set_property IOSTANDARD LVCMOS33 [get_ports {led[*]}]
