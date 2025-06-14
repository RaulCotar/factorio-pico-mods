function scale_anim(anim, scale)
    if anim.layers then
        for _, layer in ipairs(anim.layers) do
            if layer.scale then
                layer.scale = layer.scale * scale
            end
        end
    else
        if anim.scale then
            anim.scale = anim.scale * scale
        end
    end
    return anim
end

local cluster_rocket_ammo = {
    type = "ammo",
    name = "cluster-rocket",
    icon = "__pico-combat__/graphics/icons/micromissile-pack.png",
    subgroup = "ammo",
    ammo_category = "rocket",
    order = "d[rocket-launcher]-e[cluster-rocket]",
    inventory_move_sound = item_sounds.ammo_small_inventory_move,
    pick_sound = item_sounds.ammo_small_inventory_move,
    drop_sound = item_sounds.ammo_small_inventory_move,
    stack_size = 100,
    magazine_size = 3,
    weight = data.raw["ammo"]["rocket"].weight * 1.1,
    ammo_type =
    {
        target_type = "position", -- can freefire without a target entity
        cooldown_modifier = 0.3,
        action =
        {
            type = "direct",
            action_delivery =
            {
                {
                    type = "projectile",
                    projectile = "cluster-rocket",
                    starting_speed = 0.15,
                    starting_speed_deviation = 0.1,
                    direction_deviation = 0.2 * settings.startup["cluster-rocket-spread-mult"].value, -- radians
                    range_deviation = 0.2 * settings.startup["cluster-rocket-spread-mult"].value,
                    source_effects =
                    {
                        type = "create-entity",
                        entity_name = "explosion-hit"
                    }
                },
                {
                    type = "instant",
                    source_effects = {
                        {
                            type = "script",
                            effect_id = "cluster-rocket-fired"
                        }
                    }
                }
            }
        }
    }
}

local cluster_rocket_proj = {
    type = "projectile",
    name = "cluster-rocket",
    flags = { "not-on-map" },
    hidden = true,
    acceleration = 0.02,
    turn_speed = 0.002, -- this needs to be low so that when the scripted scatter event trigers the rocket doesn't immediately redress
    force_condition = "not-same",
    turning_speed_increases_exponentially_with_projectile_speed = true, -- vanilla rockets have this true
    collision_box = { { -0.5, -0.3 }, { 0.5, 0.3 } },
    action = {
        type = "direct",
        action_delivery =
        {
            type = "instant",
            target_effects =
            {
                {
                    type = "create-entity",
                    entity_name = "explosion"
                },
                {
                    type = "damage",
                    damage =
                    {
                        amount = 68 * settings.startup["cluster-rocket-dmg-mult"].value,
                        type = "explosion"
                    }
                },
                {
                    type = "create-entity",
                    entity_name = "small-scorchmark-tintable",
                    check_buildability = true
                },
                {
                    type = "invoke-tile-trigger",
                    repeat_count = 1
                },
                {
                    type = "destroy-decoratives",
                    from_render_layer = "decorative",
                    to_render_layer = "object",
                    include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
                    include_decals = false,
                    invoke_decorative_trigger = true,
                    decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
                    radius = 0.9                           -- results in ~1/3 of vanilla area
                }
            }
        }
    },
    --light = {intensity = 0.5, size = 4},
    animation = scale_anim(require("__base__.prototypes.entity.rocket-projectile-pictures").animation({ 1, 0.8, 0.3 }), 0.7),
    shadow = scale_anim(require("__base__.prototypes.entity.rocket-projectile-pictures").shadow, 0.7),
    smoke = require("__base__.prototypes.entity.rocket-projectile-pictures").smoke,
}

local cluster_rocket_rec = {
    type = "recipe",
    name = "cluster-rocket",
    category = "advanced-crafting",
    subgroup = "ammo",
    allow_productivity = true,
    enabled = false,
    energy_required = 5, -- vanilla is 4
    ingredients =
    {
        { type = "item", name = "plastic-bar",  amount = 1 },
        { type = "item", name = "iron-plate",   amount = 2 },
        { type = "item", name = "explosives",   amount = 1 }
    },
    results = { { type = "item", name = "cluster-rocket", amount = 1 } }
}

local cluster_rocket_ex_ammo = {
    type = "ammo",
    name = "cluster-rocket-explosive",
    icon = "__pico-combat__/graphics/icons/micromissile-explosive-pack.png",
    subgroup = "ammo",
    ammo_category = "rocket",
    order = "d[rocket-launcher]-e[cluster-rocket-explosive]",
    inventory_move_sound = item_sounds.ammo_small_inventory_move,
    pick_sound = item_sounds.ammo_small_inventory_move,
    drop_sound = item_sounds.ammo_small_inventory_move,
    stack_size = 100,
    magazine_size = 3,
    weight = data.raw["ammo"]["explosive-rocket"].weight * 1.1,
    ammo_type =
    {
        target_type = "position", -- can freefire without a target entity
        cooldown_modifier = 0.3,
        action =
        {
            type = "direct",
            action_delivery =
            {
                {
                    type = "projectile",
                    projectile = "cluster-rocket-explosive",
                    starting_speed = 0.15,
                    starting_speed_deviation = 0.1,
                    direction_deviation = 0.2 * settings.startup["cluster-rocket-spread-mult"].value, -- radians
                    range_deviation = 0.2 * settings.startup["cluster-rocket-spread-mult"].value,
                    source_effects =
                    {
                        type = "create-entity",
                        entity_name = "explosion-hit"
                    }
                },
                {
                    type = "instant",
                    source_effects = {
                        {
                            type = "script",
                            effect_id = "cluster-rocket-fired"
                        }
                    }
                }
            }
        }
    }
}

local cluster_rocket_ex_proj = {
    type = "projectile",
    name = "cluster-rocket-explosive",
    flags = { "not-on-map" },
    hidden = true,
    acceleration = 0.02,
    turn_speed = 0.002, -- this needs to be low so that when the scripted scatter event trigers the rocket doesn't immediately redress
    force_condition = "not-same",
    turning_speed_increases_exponentially_with_projectile_speed = true, -- vanilla rockets have this true
    collision_box = { { -0.5, -0.3 }, { 0.5, 0.3 } },
    action = {
        type = "direct",
        action_delivery =
        {
            type = "instant",
            target_effects =
            {
                {
                    type = "create-entity",
                    entity_name = "explosion"
                },
                {
                    type = "damage",
                    damage =
                    {
                        amount = 18 * settings.startup["cluster-rocket-dmg-mult"].value,
                        type = "explosion"
                    }
                },
                {
                    type = "create-entity",
                    entity_name = "medium-scorchmark-tintable",
                    check_buildability = true
                },
                {
                    type = "invoke-tile-trigger",
                    repeat_count = 1
                },
                {
                    type = "destroy-decoratives",
                    from_render_layer = "decorative",
                    to_render_layer = "object",
                    include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
                    include_decals = false,
                    invoke_decorative_trigger = true,
                    decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
                    radius = 2.0                           -- large radius for demostrative purposes
                },
                {
                    type = "nested-result",
                    action =
                    {
                        type = "area",
                        radius = 3.8, -- vanilla is 6.5 -> for 1/3 of vanilla area, we need a radius of ~3.75 
                        action_delivery =
                        {
                            type = "instant",
                            target_effects =
                            {
                                {
                                    type = "damage",
                                    damage =
                                    {
                                        amount = 35 * settings.startup["cluster-rocket-dmg-mult"].value,
                                        type = "explosion"
                                    }
                                },
                                {
                                    type = "create-entity",
                                    entity_name = "explosion"
                                }
                            }
                        }
                    }
                }
            }
        }
    },
    --light = {intensity = 0.5, size = 4},
    animation = scale_anim(require("__base__.prototypes.entity.rocket-projectile-pictures").animation({ 1, 0.2, 0.2 }), 0.7),
    shadow = scale_anim(require("__base__.prototypes.entity.rocket-projectile-pictures").shadow, 0.7),
    smoke = require("__base__.prototypes.entity.rocket-projectile-pictures").smoke,
}

local cluster_rocket_ex_rec = {
    type = "recipe",
    name = "cluster-rocket-explosive",
    category = "advanced-crafting",
    subgroup = "ammo",
    allow_productivity = true,
    enabled = false,
    energy_required = 9, -- vanilla is 8
    ingredients =
    {
        { type = "item", name = "cluster-rocket",   amount = 1 },
        { type = "item", name = "explosives",       amount = 2 }
    },
    results = { { type = "item", name = "cluster-rocket-explosive", amount = 1 } }
}

local cluster_rocket_tech = {
    type = "technology",
    name = "cluster-rocketry",
    icon_size = 256,
    icon = "__pico-combat__/graphics/technology/mass-rocketry.png",
    prerequisites = {"explosive-rocketry"},
    unit =
    {
        ingredients =
        {
            { "automation-science-pack", 1 },
            { "logistic-science-pack",   1 },
            { "military-science-pack",   1 },
            { "chemical-science-pack",   1 }
        },
        time = 30,
        count = 200
    },
    effects =
    {
        {
            type = "unlock-recipe",
            recipe = "cluster-rocket"
        },
        {
            type = "unlock-recipe",
            recipe = "cluster-rocket-explosive"
        }
    }
}

if settings.startup["enable-cluster-rockets"].value then
    data.extend{
        cluster_rocket_ammo,
        cluster_rocket_proj,
        cluster_rocket_rec,
        cluster_rocket_ex_ammo,
        cluster_rocket_ex_proj,
        cluster_rocket_ex_rec,
        cluster_rocket_tech
    }
end