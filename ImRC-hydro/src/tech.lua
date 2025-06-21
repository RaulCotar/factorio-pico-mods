local tech = {
	type = "technology",
	name = "hydroelectrics",
	icon = "__ImRC-hydro__/graphics/tech/hydroelectrics.png",
	icon_size = 400,
	effects = {
		{ type = "unlock-recipe", recipe = "fluid-basin" },
		{ type = "unlock-recipe", recipe = "fluid-reservoir" },
		{ type = "unlock-recipe", recipe = "hydro-generator" },
		{ type = "unlock-recipe", recipe = "hydro-pump" },
		{ type = "unlock-recipe", recipe = "penstock" },
	},
	prerequisites = {
		"electric-engine",
		"electric-energy-distribution-2",
		"cliff-explosives",
		"landfill"
	},
	unit = {
		time = 30,
		count = 200,
		ingredients = {
			{ "automation-science-pack", 1 },
			{ "logistic-science-pack",   1 },
			{ "chemical-science-pack",   1 }
		},
	}
}

data:extend { tech }