set_property -dict { PACKAGE_PIN R15 IOSTANDARD LVCMOS33 } [ get_port { rt_in[1] } ] ;
set_property -dict { PACKAGE_PIN M13 IOSTANDARD LVCMOS33 } [ get_port { rt_in[0] } ] ;
set_property -dict { PACKAGE_PIN L16 IOSTANDARD LVCMOS33 } [ get_port { rs_in[1] } ] ;
set_property -dict { PACKAGE_PIN J15 IOSTANDARD LVCMOS33 } [ get_port { rs_in[0] } ] ;


set_property -dict { PACKAGE_PIN U18 IOSTANDARD LVCMOS33 } [ get_port { pc_in[2] } ] ;
set_property -dict { PACKAGE_PIN T18 IOSTANDARD LVCMOS33 } [ get_port { pc_in[1] } ] ;
set_property -dict { PACKAGE_PIN R17 IOSTANDARD LVCMOS33 } [ get_port { pc_in[0] } ] ;

set_property -dict { PACKAGE_PIN U8 IOSTANDARD LVCMOS33 } [ get_port { target_address_in[2] } ] ;
set_property -dict { PACKAGE_PIN V10 IOSTANDARD LVCMOS33 } [ get_port { target_address_in[1] } ] ;
set_property -dict { PACKAGE_PIN U11 IOSTANDARD LVCMOS33 } [ get_port { target_address_in[0] } ] ;

set_property -dict { PACKAGE_PIN U12 IOSTANDARD LVCMOS33 } [ get_port { branch_type[1] } ] ;
set_property -dict { PACKAGE_PIN H6 IOSTANDARD LVCMOS33 } [ get_port { branch_type[0] } ] ;

set_property -dict { PACKAGE_PIN T13 IOSTANDARD LVCMOS33 } [ get_port { pc_sel[1] } ] ;
set_property -dict { PACKAGE_PIN R16 IOSTANDARD LVCMOS33 } [ get_port { pc_sel[0] } ] ;


set_property -dict { PACKAGE_PIN N14 IOSTANDARD LVCMOS33 } [ get_port { next_pc_out[2] } ] ;
set_property -dict { PACKAGE_PIN J13 IOSTANDARD LVCMOS33 } [ get_port { next_pc_out[1] } ] ;
set_property -dict { PACKAGE_PIN K15 IOSTANDARD LVCMOS33 } [ get_port { next_pc_out[0] } ] ;
