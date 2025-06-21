local startup_settings = {
	{type="bool-setting",	name="enable-t2walls",					default_value=true},
	{type="int-setting",	name="t2wall-health",					default_value=500,	minimum_value=1},
	{type="double-setting",	name="t2wall-resistance-multiplier",	default_value=1,	minimum_value=0,	maximum_value=10},

	{type="bool-setting",	name="enable-cluster-rockets",			default_value=true},
	{type="double-setting",	name="cluster-rocket-dmg-mult",			default_value=1,	minimum_value=0},
	{type="double-setting",	name="cluster-rocket-spread-mult",		default_value=1,	minimum_value=0},

	{type="bool-setting",	name="enable-chainsaw",					default_value=true},
	{type="double-setting",	name="chainsaw-dmg-mult",				default_value=1,	minimum_value=0},
	{type="double-setting",	name="chainsaw-fuel-cons-mult",			default_value=1,	minimum_value=0},
}

for i, setting in pairs(startup_settings) do
	setting.setting_type = "startup"
	setting.order = string.format("%03d", i)
	data:extend({setting})
end