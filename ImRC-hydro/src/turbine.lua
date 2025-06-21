require("src.utils")

local item = {
	type = "item",
	name = "hydro-generator",
	place_result = "hydro-generator",
	order = "hydro-generator",
	subgroup = "hydroelectrics",
	stack_size = 50,
	icon = "__ImRC-hydro__/graphics/icon/turbine.png",
	icon_size = 96,
}

local recipe = {
	type = "recipe",
	name = "hydro-generator",
	enabled = false,
	energy_required = 25,
	ingredients = {
		{ type = "item", name = "copper-plate",         amount = 20 },
		{ type = "item", name = "steel-plate",          amount = 10 },
		{ type = "item", name = "electric-engine-unit", amount = 1 },
	},
	results = {
		{ type = "item", name = "hydro-generator", amount = 1 },
	},
}

local entity = {
	type = "fusion-generator",
	name = "hydro-generator",
	max_health = 500,
	minable = { mining_time = 0.5, result = "hydro-generator" },
	collision_box = { { -1.4, -2.4}, { 1.4, 2.4 } },
	selection_box = { { -1.5, -2.5}, { 1.5, 2.5 } },
	energy_source = {
		type = "electric",
		drain = "5kW",
		input_flow_limit = "5kW",
		output_flow_limit = "40MW",
		usage_priority = "primary-output",
	},
	max_fluid_usage = 833.34,
	input_fluid_box = {
		production_type = "input",
		volume = 17000,
		filter = "water",
		pipe_connections = {
			{ direction = 8, position = { 0, 2 }, flow_direction = "input", connection_category = { "upstream" } },
		},
		pipe_covers = default_pipe_covers()
	},
	output_fluid_box = {
		production_type = "output",
		volume = 17000,
		filter = "water",
		pipe_connections = {
			{ direction = 0, position = { 0, -2 }, flow_direction = "output", connection_category = { "downstream" } },
		},
		pipe_covers = default_pipe_covers()
	},
	icon = "__ImRC-hydro__/graphics/icon/turbine.png",
	icon_size = 96,
	impact_category = "metal",
	graphics_set = {
		north_graphics_set = {
			animation = {
				filename = "__ImRC-hydro__/graphics/entity/turbine-north.png",
				size = { 96, 160 },
				frame_count = 1,
			},
			fluid_input_graphics = {{}},
		},
		east_graphics_set = {
			animation = {
				filename = "__ImRC-hydro__/graphics/entity/turbine-east.png",
				size = { 160, 96 },
				frame_count = 1,
			},
			fluid_input_graphics = {{}},
		},
		south_graphics_set = {
			animation = {
				filename = "__ImRC-hydro__/graphics/entity/turbine-south.png",
				size = { 96, 160 },
				frame_count = 1,
			},
			fluid_input_graphics = {{}},
		},
		west_graphics_set = {
			animation = {
				filename = "__ImRC-hydro__/graphics/entity/turbine-west.png",
				size = { 160, 96 },
				frame_count = 1,
			},
			fluid_input_graphics = {{}},
		},
	}
}

data:extend {
	item,
	recipe,
	entity
}