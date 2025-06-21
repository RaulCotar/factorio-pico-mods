local item = {
	type = "item",
	name = "penstock",
	place_result = "penstock",
	order = "penstock",
	subgroup = "hydroelectrics",
	stack_size = 50,
	icon = "__ImRC-hydro__/graphics/icon/penstock.png",
	pick_sound = data.raw["item"]["pipe"].pick_sound,
	inventory_move_sound = data.raw["item"]["pipe"].inventory_move_sound,
	drop_sound = data.raw["item"]["pipe"].drop_sound,
}

local recipe = {
	type = "recipe",
	name = "penstock",
	category = "advanced-crafting",
	enabled = false,
	energy_required = 10,
	ingredients = {
		{ type = "item",  name = "pipe-to-ground", amount = 2 },
		{ type = "item", name = "concrete", amount = 1 },
	},
	results = {
		{ type = "item", name = "penstock", amount = 1 },
	},
}

local entity = table.deepcopy(data.raw["pipe"]["pipe"])
entity.name = "penstock"
entity.fluid_box.volume = 1500
entity.fluid_box.pipe_connections = {
	{ direction = 0,  position = { 0, 0 }, connection_category = { "upstream", "downstream" } },
	{ direction = 4,  position = { 0, 0 }, connection_category = { "upstream", "downstream" } },
	{ direction = 8,  position = { 0, 0 }, connection_category = { "upstream", "downstream" } },
	{ direction = 12, position = { 0, 0 }, connection_category = { "upstream", "downstream" } }
}
entity.minable = { mining_time = 0.15, result = "penstock" }
entity.icons = { {
	icon = entity.icon,
	scale = 0.5,
	tint = { 0, 0, 0, 0.5 }
} }
entity.icon = nil
for k, pic in pairs(entity.pictures) do
	pic.tint = { 0.5, 0.5, 0.5 }
	entity.pictures[k] = pic
end

data:extend {
	item,
	recipe,
	entity
}