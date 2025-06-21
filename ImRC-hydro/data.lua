log(data.raw["fluid"]["water"].heat_capacity)
-- data.raw["fluid"]["water"].fuel_value = "1J"
data.raw["fluid"]["water"].heat_capacity = "2kJ" -- default
require("src.reservoir")
require("src.basin")
require("src.turbine")
require("src.penstock")
require("src.pump")
require("src.outlet")
require("src.tech")

data:extend {
	-- temporary subgroup (for ez dev)
	{
		type = "item-subgroup",
		name = "hydroelectrics",
		group = "logistics",
		order = "h",
	}
}
