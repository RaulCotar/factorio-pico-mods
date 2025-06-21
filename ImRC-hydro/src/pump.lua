local item = {
	type = "item",
	name = "hydro-pump",
	place_result = "hydro-pump",
	order = "hydro-pump",
	subgroup = "hydroelectrics",
	stack_size = 50,
	icon = "__ImRC-hydro__/graphics/icon/hydro-pump.png",
	pick_sound = data.raw["item"]["pump"].pick_sound,
	inventory_move_sound = data.raw["item"]["pump"].inventory_move_sound,
	drop_sound = data.raw["item"]["pump"].drop_sound,
}

local recipe = {
	type = "recipe",
	name = "hydro-pump",
	category = "advanced-crafting",
	enabled = false,
	energy_required = data.raw["recipe"]["pump"].energy_required * 2,
	ingredients = {
		{ type = "item", name = "pump",                 amount = 1 },
		{ type = "item", name = "electric-engine-unit", amount = 1 },
	},
	results = {
		{ type = "item", name = "hydro-pump", amount = 1 },
	},
}

local entity = table.deepcopy(data.raw["pump"]["pump"])
entity.name = "hydro-pump"
entity.energy_usage = "10MW"
entity.fluid_box.volume = 4000
entity.pumping_speed = 166.67
entity.flow_scaling = false
entity.fluid_box.pipe_connections = {
	{ direction = 0, flow_direction = "output", position = { 0, -0.5 }, connection_category = { "upstream", "default" } },
	{ direction = 8, flow_direction = "input",  position = { 0, 0.5 },  connection_category = { "downstream", "default" } }
}
entity.minable = { mining_time = 0.25, result = "hydro-pump" }
entity.icons = { {
	icon = entity.icon,
	scale = 0.5,
	tint = { 0, 0, 0, 0.5 }
} }
entity.icon = nil

data:extend {
	item,
	recipe,
	entity
}