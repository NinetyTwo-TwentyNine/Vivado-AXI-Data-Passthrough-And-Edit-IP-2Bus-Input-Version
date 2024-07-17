# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  ipgui::add_param $IPINST -name "AXI_READ_RPLC_AMOUNT"
  ipgui::add_param $IPINST -name "AXI_WRITE_RPLC_AMOUNT"
  ipgui::add_param $IPINST -name "C_S00_AXI_DATA_WIDTH" -widget comboBox
  ipgui::add_param $IPINST -name "C_S00_AXI_ADDR_WIDTH"

}

proc update_PARAM_VALUE.AXI_READ_RPLC_AMOUNT { PARAM_VALUE.AXI_READ_RPLC_AMOUNT } {
	# Procedure called to update AXI_READ_RPLC_AMOUNT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_READ_RPLC_AMOUNT { PARAM_VALUE.AXI_READ_RPLC_AMOUNT } {
	# Procedure called to validate AXI_READ_RPLC_AMOUNT
	return true
}

proc update_PARAM_VALUE.AXI_WRITE_RPLC_AMOUNT { PARAM_VALUE.AXI_WRITE_RPLC_AMOUNT } {
	# Procedure called to update AXI_WRITE_RPLC_AMOUNT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_WRITE_RPLC_AMOUNT { PARAM_VALUE.AXI_WRITE_RPLC_AMOUNT } {
	# Procedure called to validate AXI_WRITE_RPLC_AMOUNT
	return true
}

proc update_PARAM_VALUE.C_M00_AXI_ADDR_WIDTH { PARAM_VALUE.C_M00_AXI_ADDR_WIDTH } {
	# Procedure called to update C_M00_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M00_AXI_ADDR_WIDTH { PARAM_VALUE.C_M00_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_M00_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M00_AXI_DATA_WIDTH { PARAM_VALUE.C_M00_AXI_DATA_WIDTH } {
	# Procedure called to update C_M00_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M00_AXI_DATA_WIDTH { PARAM_VALUE.C_M00_AXI_DATA_WIDTH } {
	# Procedure called to validate C_M00_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to update C_S00_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_S00_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to update C_S00_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to validate C_S00_AXI_DATA_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.AXI_READ_RPLC_AMOUNT { MODELPARAM_VALUE.AXI_READ_RPLC_AMOUNT PARAM_VALUE.AXI_READ_RPLC_AMOUNT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_READ_RPLC_AMOUNT}] ${MODELPARAM_VALUE.AXI_READ_RPLC_AMOUNT}
}

proc update_MODELPARAM_VALUE.AXI_WRITE_RPLC_AMOUNT { MODELPARAM_VALUE.AXI_WRITE_RPLC_AMOUNT PARAM_VALUE.AXI_WRITE_RPLC_AMOUNT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_WRITE_RPLC_AMOUNT}] ${MODELPARAM_VALUE.AXI_WRITE_RPLC_AMOUNT}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M00_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_M00_AXI_DATA_WIDTH PARAM_VALUE.C_M00_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M00_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_M00_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M00_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_M00_AXI_ADDR_WIDTH PARAM_VALUE.C_M00_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M00_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_M00_AXI_ADDR_WIDTH}
}

