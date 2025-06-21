require("src.utils")

local item = {
	type = "item",
	name = "fluid-reservoir",
	place_result = "fluid-reservoir",
	order = "fluid-reservoir",
	subgroup = "hydroelectrics",
	stack_size = 50,
	icon = "__ImRC-hydro__/graphics/icon/reservoir.png",
	icon_size = 96,
	pick_sound = data.raw["item"]["storage-tank"].pick_sound,
	inventory_move_sound = data.raw["item"]["storage-tank"].inventory_move_sound,
	drop_sound = data.raw["item"]["storage-tank"].drop_sound,
}

local recipe = {
	type = "recipe",
	name = "fluid-reservoir",
	enabled = false,
	energy_required = data.raw["recipe"]["landfill"].energy_required,
	ingredients = {
		{ type = "item", name = "stone",            amount = 1000 },
		{ type = "item", name = "steel-plate",      amount = 10 },
		{ type = "item", name = "cliff-explosives", amount = 1 },
	},
	results = {
		{ type = "item", name = "fluid-reservoir", amount = 25 },
	},
}

local entity = {
	type = "storage-tank",
	name = "fluid-reservoir",
	max_health = 500,
	minable = { mining_time = 0.5, result = "fluid-reservoir" },
	impact_category = "stone",
	collision_box = { { -0.45, -0.45 }, { 0.45, 0.45 } },
	selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
	window_bounding_box = { { -0.5, -0.5 }, { 0.5, 0.25 } },
	fluid_box = {
		volume = 55000,
		pipe_connections = {
			{ direction = 0,  position = { 0, 0 }, connection_category = { "upstream" } },
			{ direction = 4,  position = { 0, 0 }, connection_category = { "upstream" } },
			{ direction = 8,  position = { 0, 0 }, connection_category = { "upstream" } },
			{ direction = 12, position = { 0, 0 }, connection_category = { "upstream" } }
		},
		pipe_covers = {
			south = {
				layers = { {
					filename = "__ImRC-hydro__/graphics/entity/reservoir-cover-south.png",
					size = { 64, 320 },
					scale = 0.5,
					priority = "extra-high",
				} }
			}, -- second layer will be the shadow
			east = data.raw["storage-tank"]["storage-tank"].fluid_box.pipe_covers.east,
			north = data.raw["storage-tank"]["storage-tank"].fluid_box.pipe_covers.north,
			west = data.raw["storage-tank"]["storage-tank"].fluid_box.pipe_covers.west,
		}
	},
	icon = "__ImRC-hydro__/graphics/icon/reservoir.png",
	icon_size = 96,
	pictures = {
		flow_sprite = {
			filename = "__base__/graphics/entity/pipe/fluid-flow-low-temperature.png",
			size = { 160, 20 },
			priority = "extra-high"
		},
	},
	flow_length_in_ticks = 360, -- I still don't understand what this is
	squeak_behaviour = false, -- tell Squeak Through not to shrink the collision box
}

data:extend {
	item,
	recipe,
	entity
}