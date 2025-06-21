require("src.utils")

local collision_layer = {
	type = "collision-layer",
	name = "underwater"
}

local item = {
	type = "item",
	name = "fluid-basin",
	place_result = "fluid-basin",
	order = "fluid-basin",
	subgroup = "hydroelectrics",
	stack_size = 1250,
	icon = "__ImRC-hydro__/graphics/icon/basin.png",
	pick_sound = data.raw["item"]["pipe"].pick_sound,
	inventory_move_sound = data.raw["item"]["pipe"].inventory_move_sound,
	drop_sound = data.raw["item"]["pipe"].drop_sound,
}

local recipe = {
	type = "recipe",
	name = "fluid-basin",
	category = "advanced-crafting",
	enabled = false,
	energy_required = data.raw["recipe"]["landfill"].energy_required,
	ingredients = {
		{ type = "item",  name = "stone", amount = 1 },
		{ type = "fluid", name = "water", amount = 50 },
	},
	results = {
		{ type = "item", name = "fluid-basin", amount = 1 },
	},
}

local entity = table.deepcopy(data.raw["pipe"]["pipe"])
entity.name = "fluid-basin"
entity.max_health = 2000
entity.fluid_box.volume = 275000 / 25
entity.fluid_box.pipe_connections = {
	{ direction = 0,  position = { 0, 0 }, connection_category = { "downstream" } },
	{ direction = 4,  position = { 0, 0 }, connection_category = { "downstream" } },
	{ direction = 8,  position = { 0, 0 }, connection_category = { "downstream" } },
	{ direction = 12, position = { 0, 0 }, connection_category = { "downstream" } }
}
entity.minable = { mining_time = 0.1, result = "fluid-basin" }
entity.collision_mask = { layers = { ground_tile = true, underwater = true } }
entity.icon = "__ImRC-hydro__/graphics/icon/basin.png"
entity.icon_size = 64
for k, pic in pairs(entity.pictures) do
	pic.tint = { 0, 0.1, 0.1, 0.1 }
	entity.pictures[k] = pic
end

data:extend {
	collision_layer,
	item,
	recipe,
	entity
}