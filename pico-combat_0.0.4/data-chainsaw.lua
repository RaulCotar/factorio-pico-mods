local csaw_gun = {
    type = "gun",
    subgroup = "gun",
    name = "chainsaw",
    icon = "__pico-combat__/graphics/icons/chainsaw.png",
    stack_size = 5,
    order = "a[basic-clips]-b[chainsaw]",
    attack_parameters = {
        type = "beam",
        movement_slow_down_factor = 0.25,
        range = 1.0,
        range_mode = "bounding-box-to-bounding-box",
        warmup = 30,                                    -- take some time to spin up
        cooldown = 0,                                   -- fire every tick
        projectile_creation_distance = 0,
        ammo_category = "flamethrower",                 -- "melee" is for biters
        ammo_consumption_modifier = 0.1,
        -- ammo_type = {
        --     target_type = "direction",
        --     source_type = "default",
        --     action = {
        --         {
        --             type = "line",
        --             range = 1.0,
        --             width = 1,
        --             range_effects = {
        --                 {
        --                     type = "create-trivial-smoke",
        --                     smoke_name = "fire-smoke"
        --                 }
        --             },
        --             action_delivery = {
        --                 {
        --                     type = "instant",
        --                     target_effects = {
        --                         type = "damage",
        --                         damage = {
        --                             amount = 20,
        --                             type = "physical"
        --                         }
        --                     }
        --                 }
        --             }
        --         }
        --     }
        -- },
    }
}

local csaw_rec = {
    type = "recipe",
    name = "chainsaw",
    category = "advanced-crafting",
    -- subgroup = "gun",
    allow_productivity = true,
    enabled = false,
    energy_required = 15,
    ingredients =
    {
        { type = "item", name = "iron-gear-wheel",  amount = 10 },
        { type = "item", name = "steel-plate",      amount = 5 },
        { type = "item", name = "engine-unit",      amount = 1 },
        { type = "fluid", name = "lubricant",       amount = 5 }
    },
    results = { { type = "item", name = "chainsaw", amount = 1 } }
}

local csaw_tech = {
    type = "technology",
    name = "chainsaw",
    icon_size = 256,
    icon = "__pico-combat__/graphics/technology/chainsaw.png",
    prerequisites = {"flamethrower"},
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
    data.extend{
        csaw_gun,
        csaw_rec,
        csaw_tech
    }
end