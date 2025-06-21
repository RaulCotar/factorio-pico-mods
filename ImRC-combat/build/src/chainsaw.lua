local beam = {
	type = "beam",
	name = "chainsaw-beam",
	damage_interval = 1, -- mandatory paramter; 1 means every tick
	-- damage_interval is not used, instead let the gun trigger ths every time it shoots
	action_triggered_automatically = false,
	width = 0.5, -- same as laser-beam
	action = {
		type = "direct",
		action_delivery = {
			type = "instant",
			target_effects = {
				{
					type = "damage",
					damage = {
						amount = 40 * settings.startup["chainsaw-dmg-mult"].value,
						type = "physical"
					}
				}
			}
		}
	},
	flags = { "not-on-map" },
	hidden = true,
	graphics_set = {
		beam = {
			body = {
				{
					layers = {
						{
							animation_speed = 0.5,
							blend_mode = "additive",
							filename = "__ImRC-combat__/graphics/entity/chainsaw/beam-body.png",
							frame_count = 8,
							height = 12,
							line_length = 8,
							scale = 0.5,
							width = 64,
						}
					}
				}
			},
			head = {
				layers = {
					{
						animation_speed = 0.5,
						blend_mode = "additive",
						filename = "__ImRC-combat__/graphics/entity/chainsaw/beam-body.png",
						frame_count = 8,
						height = 12,
						line_length = 8,
						scale = 0.5,
						width = 64,
					}
				}
			},
			tail = {
				layers = {
					{
						animation_speed = 0.5,
						blend_mode = "additive",
						filename = "__ImRC-combat__/graphics/entity/chainsaw/beam-end.png",
						frame_count = 5,
						size = {200, 120},
						scale = 0.25,
						shift = {
							0.359375,
							0.03125
						},
					}
				}
			}
		},
	}
}

local gun = {
	type = "gun",
	name = "chainsaw",
	subgroup = "gun",
	order = "a[basic-clips]-b[chainsaw]",
	stack_size = 5,
	icon = "__ImRC-combat__/graphics/icons/chainsaw.png",
	attack_parameters = {
		type = "beam",
		ammo_categories = { "flamethrower" },
		warmup = 5, -- I think this has to be shorter than the duration for the gun to actually shoot
		cooldown = 6,
		range = 1.8,
		range_mode = "bounding-box-to-bounding-box",
		movement_slow_down_factor = 0.2,
		source_offset = {
			0,
			-0.85587225
		},
		ammo_type = {
			action = {
				type = "direct",
				action_delivery = {
					type = "beam",
					beam = "chainsaw-beam",
					duration = 6,
					max_length = 10, -- idk
					source_offset = {
						0,
						-1.3143899999999999
					},
				},
			},
		},
	},
}

local recipe = {
	type = "recipe",
	name = "chainsaw",
	category = "advanced-crafting",
	-- subgroup = "gun",
	allow_productivity = true,
	enabled = false,
	energy_required = 15,
	ingredients =
	{
		{ type = "item",  name = "iron-gear-wheel", amount = 5 },
		{ type = "item",  name = "steel-plate",     amount = 5 },
		{ type = "item",  name = "engine-unit",     amount = 1 },
		{ type = "fluid", name = "lubricant",       amount = 1 }
	},
	results = { { type = "item", name = "chainsaw", amount = 1 } }
}

local tech = {
	type = "technology",
	name = "chainsaw",
	icon_size = 256,
	icon = "__ImRC-combat__/graphics/technology/chainsaw.png",
	prerequisites = { "flamethrower" },
	unit =
	{
		ingredients =
		{
			{ "automation-science-pack", 1 },
			{ "logistic-science-pack",   1 },
			{ "military-science-pack",   1 }
		},
		time = 30,
		count = 50
	},
	effects =
	{
		{
			type = "unlock-recipe",
			recipe = "chainsaw"
		}
	}
}

if settings.startup["enable-chainsaw"].value then
	data.extend {
		beam,
		gun,
		recipe,
		tech
	}
end