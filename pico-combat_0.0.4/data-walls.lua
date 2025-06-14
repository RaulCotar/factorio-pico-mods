t2w_ent = table.deepcopy(data.raw["wall"]["stone-wall"])
t2w_ent.name = "t2wall"
t2w_ent.minable = {mining_time = 0.2, result = "t2wall"}
t2w_ent.max_health = settings.startup["t2wall-health"].value
t2w_ent.corpse = "t2wall-remnants"
t2w_ent.resistances = {
    {
        type="acid",
        decrease = 5,
        percent = 80 * settings.startup["t2wall-resistance-multiplier"].value
    },
    {
        type="electric",
        decrease = 5,
        percent = 30 * settings.startup["t2wall-resistance-multiplier"].value
    },
    {
        type="explosion",
        decrease = 5,
        percent = 40 * settings.startup["t2wall-resistance-multiplier"].value
    },
    {
        type="fire",
        percent = 100
    },
    {
        type="impact",
        decrease = 60,
        percent = 80 * settings.startup["t2wall-resistance-multiplier"].value
    },
    {
        type="laser",
        decrease = 5,
        percent = 70 * settings.startup["t2wall-resistance-multiplier"].value
    },
    {
        type="physical",
        decrease = 15,
        percent = 50 * settings.startup["t2wall-resistance-multiplier"].value
    },
    {
        type="poison",
        percent = 100
    }
}
t2w_ent.pictures = {
  single =
  {
    layers =
    {
      {
        filename = "__pico-combat__/graphics/entity/t2wall/t2wall-single.png",
        priority = "extra-high",
        width = 64,
        height = 86,
        variation_count = 2,
        line_length = 2,
        shift = util.by_pixel(0, -5),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/wall/wall-single-shadow.png",
        priority = "extra-high",
        width = 98,
        height = 60,
        repeat_count = 2,
        shift = util.by_pixel(10, 17),
        draw_as_shadow = true,
        scale = 0.5
      }
    }
  },
  straight_vertical =
  {
    layers =
    {
      {
        filename = "__pico-combat__/graphics/entity/t2wall/t2wall-vertical.png",
        priority = "extra-high",
        width = 64,
        height = 134,
        variation_count = 5,
        line_length = 5,
        shift = util.by_pixel(0, 8),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/wall/wall-vertical-shadow.png",
        priority = "extra-high",
        width = 98,
        height = 110,
        repeat_count = 5,
        shift = util.by_pixel(10, 29),
        draw_as_shadow = true,
        scale = 0.5
      }
    }
  },
  straight_horizontal =
  {
    layers =
    {
      {
        filename = "__pico-combat__/graphics/entity/t2wall/t2wall-horizontal.png",
        priority = "extra-high",
        width = 64,
        height = 92,
        variation_count = 6,
        line_length = 6,
        shift = util.by_pixel(0, -2),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/wall/wall-horizontal-shadow.png",
        priority = "extra-high",
        width = 124,
        height = 68,
        repeat_count = 6,
        shift = util.by_pixel(14, 15),
        draw_as_shadow = true,
        scale = 0.5
      }
    }
  },
  corner_right_down =
  {
    layers =
    {
      {
        filename = "__pico-combat__/graphics/entity/t2wall/t2wall-corner-right.png",
        priority = "extra-high",
        width = 64,
        height = 128,
        variation_count = 2,
        line_length = 2,
        shift = util.by_pixel(0, 7),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/wall/wall-corner-right-shadow.png",
        priority = "extra-high",
        width = 124,
        height = 120,
        repeat_count = 2,
        shift = util.by_pixel(17, 28),
        draw_as_shadow = true,
        scale = 0.5
      }
    }
  },
  corner_left_down =
  {
    layers =
    {
      {
        filename = "__pico-combat__/graphics/entity/t2wall/t2wall-corner-left.png",
        priority = "extra-high",
        width = 64,
        height = 134,
        variation_count = 2,
        line_length = 2,
        shift = util.by_pixel(0, 7),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/wall/wall-corner-left-shadow.png",
        priority = "extra-high",
        width = 102,
        height = 120,
        repeat_count = 2,
        shift = util.by_pixel(9, 28),
        draw_as_shadow = true,
        scale = 0.5
      }
    }
  },
  t_up =
  {
    layers =
    {
      {
        filename = "__pico-combat__/graphics/entity/t2wall/t2wall-t.png",
        priority = "extra-high",
        width = 64,
        height = 134,
        variation_count = 4,
        line_length = 4,
        shift = util.by_pixel(0, 7),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/wall/wall-t-shadow.png",
        priority = "extra-high",
        width = 124,
        height = 120,
        repeat_count = 4,
        shift = util.by_pixel(14, 28),
        draw_as_shadow = true,
        scale = 0.5
      }
    }
  },
  ending_right =
  {
    layers =
    {
      {
        filename = "__pico-combat__/graphics/entity/t2wall/t2wall-ending-right.png",
        priority = "extra-high",
        width = 64,
        height = 92,
        variation_count = 2,
        line_length = 2,
        shift = util.by_pixel(0, -3),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/wall/wall-ending-right-shadow.png",
        priority = "extra-high",
        width = 124,
        height = 68,
        repeat_count = 2,
        shift = util.by_pixel(17, 15),
        draw_as_shadow = true,
        scale = 0.5
      }
    }
  },
  ending_left =
  {
    layers =
    {
      {
        filename = "__pico-combat__/graphics/entity/t2wall/t2wall-ending-left.png",
        priority = "extra-high",
        width = 64,
        height = 92,
        variation_count = 2,
        line_length = 2,
        shift = util.by_pixel(0, -3),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/wall/wall-ending-left-shadow.png",
        priority = "extra-high",
        width = 102,
        height = 68,
        repeat_count = 2,
        shift = util.by_pixel(9, 15),
        draw_as_shadow = true,
        scale = 0.5
      }
    }
  },
  filling =
  {
    filename = "__pico-combat__/graphics/entity/t2wall/t2wall-filling.png",
    priority = "extra-high",
    width = 48,
    height = 56,
    variation_count = 8,
    line_length = 8,
    shift = util.by_pixel(0, -1),
    scale = 0.5
  },
  water_connection_patch =
  {
    sheets =
    {
      {
        filename = "__pico-combat__/graphics/entity/t2wall/t2wall-patch.png",
        priority = "extra-high",
        width = 116,
        height = 128,
        shift = util.by_pixel(0, -2),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/wall/wall-patch-shadow.png",
        priority = "extra-high",
        width = 144,
        height = 100,
        shift = util.by_pixel(9, 15),
        draw_as_shadow = true,
        scale = 0.5
      }
    }
  },
  gate_connection_patch =
  {
    sheets =
    {
      {
        filename = "__pico-combat__/graphics/entity/t2wall/t2wall-gate.png",
        priority = "extra-high",
        width = 82,
        height = 108,
        shift = util.by_pixel(0, -7),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/wall/wall-gate-shadow.png",
        priority = "extra-high",
        width = 130,
        height = 78,
        shift = util.by_pixel(14, 18),
        draw_as_shadow = true,
        scale = 0.5
      }
    }
  }
}

t2w_remn = table.deepcopy(data.raw["corpse"]["wall-remnants"])
t2w_remn.name = "t2wall-remnants"

t2w_item = table.deepcopy(data.raw["item"]["stone-wall"])
t2w_item.name = "t2wall"
t2w_item.place_result = "t2wall"
t2w_item.icon = "__pico-combat__/graphics/icons/t2wall.png"

t2w_recipe = {
  type = "recipe",
  name = "t2wall",
  energy = 0.5,
  enabled = false,
  ingredients =
  {
    {type = "item", name = "concrete", amount = 10},
    {type = "item", name = "iron-plate", amount = 1}
  },
  results = {{type="item", name="t2wall", amount=1}}
}

t2w_tech = {
  type = "technology",
  name = "t2wall",
  icon = "__pico-combat__/graphics/technology/t2wall.png",
  icon_size = 256,
  effects =
  {
    {
      type = "unlock-recipe",
      recipe = "t2wall"
    }
  },
  prerequisites = {"stone-wall","logistic-science-pack","military-science-pack"},
  unit =
  {
    count = 50,
    ingredients = {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"military-science-pack", 1}
    },
    time = 30
  }
}

if settings.startup["enable-t2walls"].value then
  data:extend{t2w_ent, t2w_remn, t2w_item, t2w_recipe, t2w_tech}
end