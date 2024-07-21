# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "CLK_HZ" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DEFAULT_TXDIFF" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DEFAULT_TXPOST" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DEFAULT_TXPRE" -parent ${Page_0}


}

proc update_PARAM_VALUE.CLK_HZ { PARAM_VALUE.CLK_HZ } {
	# Procedure called to update CLK_HZ when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CLK_HZ { PARAM_VALUE.CLK_HZ } {
	# Procedure called to validate CLK_HZ
	return true
}

proc update_PARAM_VALUE.DEFAULT_TXDIFF { PARAM_VALUE.DEFAULT_TXDIFF } {
	# Procedure called to update DEFAULT_TXDIFF when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DEFAULT_TXDIFF { PARAM_VALUE.DEFAULT_TXDIFF } {
	# Procedure called to validate DEFAULT_TXDIFF
	return true
}

proc update_PARAM_VALUE.DEFAULT_TXPOST { PARAM_VALUE.DEFAULT_TXPOST } {
	# Procedure called to update DEFAULT_TXPOST when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DEFAULT_TXPOST { PARAM_VALUE.DEFAULT_TXPOST } {
	# Procedure called to validate DEFAULT_TXPOST
	return true
}

proc update_PARAM_VALUE.DEFAULT_TXPRE { PARAM_VALUE.DEFAULT_TXPRE } {
	# Procedure called to update DEFAULT_TXPRE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DEFAULT_TXPRE { PARAM_VALUE.DEFAULT_TXPRE } {
	# Procedure called to validate DEFAULT_TXPRE
	return true
}


proc update_MODELPARAM_VALUE.CLK_HZ { MODELPARAM_VALUE.CLK_HZ PARAM_VALUE.CLK_HZ } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CLK_HZ}] ${MODELPARAM_VALUE.CLK_HZ}
}

proc update_MODELPARAM_VALUE.DEFAULT_TXPRE { MODELPARAM_VALUE.DEFAULT_TXPRE PARAM_VALUE.DEFAULT_TXPRE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEFAULT_TXPRE}] ${MODELPARAM_VALUE.DEFAULT_TXPRE}
}

proc update_MODELPARAM_VALUE.DEFAULT_TXPOST { MODELPARAM_VALUE.DEFAULT_TXPOST PARAM_VALUE.DEFAULT_TXPOST } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEFAULT_TXPOST}] ${MODELPARAM_VALUE.DEFAULT_TXPOST}
}

proc update_MODELPARAM_VALUE.DEFAULT_TXDIFF { MODELPARAM_VALUE.DEFAULT_TXDIFF PARAM_VALUE.DEFAULT_TXDIFF } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEFAULT_TXDIFF}] ${MODELPARAM_VALUE.DEFAULT_TXDIFF}
}

