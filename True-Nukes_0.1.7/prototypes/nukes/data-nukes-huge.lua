local fireutil = require("__base__.prototypes.fire-util")
local nuke_explosions = require("data-nuke-explosions")

local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

local very_big_atomic_artillery_projectile = table.deepcopy(data.raw["artillery-projectile"]["TN-atomic-artillery-projectile"])
very_big_atomic_artillery_projectile.name = "TN-really-huge-atomic-artillery-projectile"
very_big_atomic_artillery_projectile.action.action_delivery.target_effects = nuke_explosions.N1Mt_detonation
data:extend{very_big_atomic_artillery_projectile}


data:extend{
  {
    type = "recipe-category",
    name = "nuclear-detonation"
  },
  {
    type = "item",
    name = "tritium-breeder-fuel-cell",
    icon = "__True-Nukes__/graphics/tritium-breeder-fuel-cell.png",
    icon_size = 64, icon_mipmaps = 4,
    pictures =
    {
      layers =
      {
        {
          size = 64,
          filename = "__True-Nukes__/graphics/tritium-breeder-fuel-cell.png",
          scale = 0.25,
          mipmap_count = 4
        },
        {
          draw_as_light = true,
          flags = {"light"},
          size = 64,
          filename = "__True-Nukes__/graphics/tritium-breeder-fuel-cell-light.png",
          scale = 0.25,
          mipmap_count = 4
        }
      }
    },
    subgroup = "intermediate-product",
    order = "r[uranium-processing]-c[tritium-breeder-fuel-cell]",
    fuel_category = "nuclear",
    burnt_result = "used-up-tritium-breeder-fuel-cell",
    fuel_value = "4GJ",
    stack_size = 50
  },
  {
    type = "item",
    name = "used-up-tritium-breeder-fuel-cell",
    icon = "__True-Nukes__/graphics/used-up-tritium-breeder-fuel-cell.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "s[used-up-tritium-breeder-fuel-cell]",
    stack_size = 50
  },
  {
    type = "item",
    name = "FOGBANK",
    icon = "__True-Nukes__/graphics/FOGBANK.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "r[fogbank]",
    stack_size = 50
  },
  {
    type = "recipe",
    name = "FOGBANK",
    category = "chemistry",
    energy_required = 20,
    enabled = false,
    ingredients =
    {
      {type="fluid", name="petroleum-gas", amount=20},
      {type="fluid", name="sulfuric-acid", amount=20},
      {type="item", name="low-density-structure", amount=10},
      {type="item", name="plastic-bar", amount=10}
    },
    results=
    {
      {type="item", name="FOGBANK", amount=1}
    },
    crafting_machine_tint =
    {
      primary = {r = 0.965, g = 0.482, b = 0.338, a = 1.000}, -- #f67a56ff
      secondary = {r = 0.831, g = 0.560, b = 0.222, a = 1.000}, -- #d38e38ff
      tertiary = {r = 0.728, g = 0.818, b = 0.443, a = 1.000}, -- #b9d070ff
      quaternary = {r = 0.939, g = 0.763, b = 0.191, a = 1.000}, -- #efc230ff
    }
  },

  {
    type = "recipe",
    name = "tritium-extraction",
    energy_required = 60,
    enabled = false,
    category = "centrifuging",
    ingredients = {{"used-up-tritium-breeder-fuel-cell", 5}},
    icon = "__True-Nukes__/graphics/tritium-extraction.png",
    icon_size = 64, icon_mipmaps = 1,
    subgroup = "intermediate-product",
    order = "r[uranium-processing]-c[tritium-extraction]",
    main_product = "",
    results = {{"tritium-canister", 1}, {"uranium-238", 3}},
    allow_decomposition = false
  },
  {
    type = "recipe",
    name = "tritium-breeder-fuel-cell",
    energy_required = 10,
    enabled = false,
    category = "crafting-with-fluid",
    ingredients =
    {
      {"iron-plate", 10},
      {"uranium-235", 1},
      {"uranium-238", 19},
      {type="fluid", name="water", amount=100}
    },
    result = "tritium-breeder-fuel-cell",
    result_count = 10
  },
  {
    type = "recipe",
    name = "megaton-nuke",
    enabled = false,
    energy_required = 120,
    ingredients =
    {
      {"steel-plate", 1000},
      {"refined-concrete", 1000},
      {"processing-unit", 150},
      {"uranium-235", 300},
      {"explosives", 150},
      {"plastic-bar", 50},
      {"red-wire", 50},
      {"green-wire", 50},
      {"advanced-circuit", 25},
      {"heat-pipe", 25},
      {"accumulator", 10}
    },
    result = "megaton-nuke"
  },
  {
    type = "item",
    name = "tritium-canister",
    icon = "__True-Nukes__/graphics/tritium-canister.png",
    icon_size = 64, icon_mipmaps = 1,
    subgroup = "intermediate-product",
    order = "q[tritium-canister]",
    stack_size = 50
  },
  {
    type = "recipe",
    name = "megaton-detonation",
    category = "nuclear-detonation",
    enabled = true,
    energy_required = 120,
    ingredients =
    {
      {"tritium-canister", 50}
    },
    result = "megaton-detonation"
  },
  {
    type = "recipe",
    name = "100kiloton-detonation",
    category = "nuclear-detonation",
    enabled = true,
    energy_required = 120,
    ingredients =
    {
      {"tritium-canister", 5}
    },
    result = "100kiloton-detonation"
  },
  {
    type = "recipe",
    name = "15kiloton-detonation",
    category = "nuclear-detonation",
    enabled = true,
    energy_required = 120,
    ingredients =
    {
    },
    result = "15kiloton-detonation"
  },
  {
    type = "item",
    name = "megaton-nuke",
    icon = "__True-Nukes__/graphics/megaton-nuke.png",
    icon_size = 64, icon_mipmaps = 1,
    subgroup = "defensive-structure",
    order = "e[nuke]-a[megaton-nuke]",
    place_result = "megaton-nuke",
    stack_size = 1
  },
  {
    type = "item",
    name = "megaton-detonation",
    icon = "__True-Nukes__/graphics/megaton-detonation.png",
    icon_size = 64, icon_mipmaps = 1,
    enabled = false,
    subgroup = "ammo",
    order = "a[nuke]-b[1Mt]",
    stack_size = 1
  },
  {
    type = "item",
    name = "100kiloton-detonation",
    icon = "__True-Nukes__/graphics/100kiloton-detonation.png",
    icon_size = 64, icon_mipmaps = 1,
    enabled = false,
    subgroup = "ammo",
    order = "a[nuke]-a[100kt]",
    stack_size = 1
  },
  {
    type = "item",
    name = "15kiloton-detonation",
    icon = "__True-Nukes__/graphics/15kiloton-detonation.png",
    icon_size = 64, icon_mipmaps = 1,
    enabled = false,
    subgroup = "ammo",
    order = "a[nuke]-a[015kt]",
    stack_size = 1
  },
  {
    type = "technology",
    name = "fusion-weapons",
    icon_size = 256, icon_mipmaps = 1,
    icon = "__True-Nukes__/graphics/fusion-bomb.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "megaton-nuke"
      },
      {
        type = "unlock-recipe",
        recipe = "15kiloton-detonation"
      },
      {
        type = "unlock-recipe",
        recipe = "100kiloton-detonation"
      },
      {
        type = "unlock-recipe",
        recipe = "megaton-detonation"
      },
      {
        type = "unlock-recipe",
        recipe = "FOGBANK"
      },
      {
        type = "unlock-recipe",
        recipe = "TN-very-big-atomic-artillery-shell"
      }
    },
    prerequisites = {"scary-atomic-weapons", "tritium-proccessing"},
    unit =
    {
      count = 2000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 45
    },
    order = "e-a-b"
  },
  {
    type = "technology",
    name = "tritium-proccessing",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__True-Nukes__/graphics/tritium-proccessing.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "tritium-breeder-fuel-cell"
      },
      {
        type = "unlock-recipe",
        recipe = "tritium-extraction"
      }
    },
    prerequisites = {"nuclear-fuel-reprocessing"},
    unit =
    {
      count = 2500,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 45
    },
    order = "e-a-b"
  },
  {
    type = "assembling-machine",
    name = "megaton-nuke",
    icon = "__True-Nukes__/graphics/megaton-nuke.png",
    icon_size = 64, icon_mipmaps = 1,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 10, result = "megaton-nuke"},
    max_health = 5000,
    corpse = "assembling-machine-1-remnants",
    dying_explosion = "massive-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-1.90, -1.40}, {1.90, 1.40}},
    selection_box = {{-2, -1.5}, {2, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    alert_icon_shift = util.by_pixel(-3, -12),
    map_color = {r = 0, g = 1, b = 0, a = 1},
	created_effect = {
		type = "direct",
		action_delivery =
		{
			type = "instant",
			target_effects = {
				type = "script",
				effect_id = "Mega-nuke built"
			}
		}
	},
	dying_trigger_effect = 
	{
	    type = "nested-result",
	    action = 
		{
			type = "direct",
			action_delivery = 
			{
				type = "instant",
				target_effects = {
					{
						type = "nested-result",
						action =
						{
							type = "area",
							target_entities = false,
							trigger_from_target = true,
							repeat_count = 1,
							radius = 1,
							action_delivery =
							{
								type = "projectile",
								show_in_tooltip = false,
								projectile = "lingering-fallout",
								starting_speed = 0.0001,
							}
						}
					},
					{
						type = "nested-result",
						action =
						{
							type = "area",
							target_entities = false,
							trigger_from_target = true,
							repeat_count = 5,
							radius = 5,
							action_delivery = 
							{
								type = "projectile",
								show_in_tooltip = false,
								projectile = "fallout",
								starting_speed = 0.0001
							}
						}
					}
				}
			}
		}
	},
    animation =
    {
      layers =
      {
		{
		  filename = "__True-Nukes__/graphics/megaton-nuke/megaton-nuke-base.png",
		  width = 212,
		  height = 192,
		  shift = util.by_pixel(0, -5),
		  scale = 0.5,
		  hr_version =
		  {
		    filename = "__True-Nukes__/graphics/megaton-nuke/megaton-nuke-base.png",
		    width = 212,
		    height = 192,
		    shift = util.by_pixel(0, -5),
		    scale = 0.5
		  }
		},
		{
		  filename = "__True-Nukes__/graphics/megaton-nuke/megaton-nuke-shadow.png",
		  priority = "high",
		  width = 287,
		  height = 159,
		  repeat_count = repeat_count,
		  shift = util.by_pixel(20, 6),
		  draw_as_shadow = true,
		  scale = 0.5,
		  hr_version =
		  {
		    filename = "__True-Nukes__/graphics/megaton-nuke/megaton-nuke-shadow.png",
		    priority = "high",
		    width = 287,
		    height = 159,
		    repeat_count = repeat_count,
		    shift = util.by_pixel(20, 6),
		    draw_as_shadow = true,
		    scale = 0.5
		  }
		 }
      }
    },
    crafting_categories = {"nuclear-detonation"},
    crafting_speed = 1,
    energy_source = {type = "void"},
    energy_usage = "1kW",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = sounds.generic_impact,
    working_sound =
    {
      sound =
	  {
	    filename = "__base__/sound/silo-alarm.ogg",
	    volume = 1.0
	  },
	  use_doppler_shift = false,
      audible_distance_modifier = 1,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    }
  }}




      
