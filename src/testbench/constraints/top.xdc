############################################################
## Clock (100 MHz)
############################################################
set_property PACKAGE_PIN F14 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name sys_clk_pin [get_ports clk]

############################################################
## Reset Button (BTN0)
############################################################
set_property PACKAGE_PIN J2 [get_ports rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports rst_n]

############################################################
## Water Level Sensors (SW0–SW4)
############################################################
set_property PACKAGE_PIN V2 [get_ports L0]
set_property IOSTANDARD LVCMOS33 [get_ports L0]

set_property PACKAGE_PIN U2 [get_ports L1]
set_property IOSTANDARD LVCMOS33 [get_ports L1]

set_property PACKAGE_PIN U1 [get_ports L2]
set_property IOSTANDARD LVCMOS33 [get_ports L2]

set_property PACKAGE_PIN T2 [get_ports L3]
set_property IOSTANDARD LVCMOS33 [get_ports L3]

set_property PACKAGE_PIN T1 [get_ports L4]
set_property IOSTANDARD LVCMOS33 [get_ports L4]

############################################################
## Water Level LEDs (LED0–LED4)
############################################################
set_property PACKAGE_PIN G1 [get_ports {led_indicators[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_indicators[0]}]

set_property PACKAGE_PIN G2 [get_ports {led_indicators[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_indicators[1]}]

set_property PACKAGE_PIN F1 [get_ports {led_indicators[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_indicators[2]}]

set_property PACKAGE_PIN F2 [get_ports {led_indicators[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_indicators[3]}]

set_property PACKAGE_PIN E1 [get_ports {led_indicators[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_indicators[4]}]

############################################################
## Motor Status LED (LED5)
############################################################
set_property PACKAGE_PIN E2 [get_ports motor_out]
set_property IOSTANDARD LVCMOS33 [get_ports motor_out]

############################################################
## Buzzer (Pmod JA Pin 1)
############################################################
set_property PACKAGE_PIN H13 [get_ports alarm_buzzer]
set_property IOSTANDARD LVCMOS33 [get_ports alarm_buzzer]
