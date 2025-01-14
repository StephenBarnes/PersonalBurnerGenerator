data:extend {
	{
		type = "generator-equipment",
		name = "personal-burner-generator",
		sprite = {
			filename = "__PersonalBurnerGenerator__/graphics/equipment.png",
			width = 192,
			height = 128,
			mipmap_count = 3,
			scale = 1,
			priority = "medium",
		},
		shape = {
			width = 4,
			height = 2,
			type = "full",
		},
		burner = {
			type = "burner",
			usage_priority = "secondary-output",
			fuel_categories = {"chemical"},
			effectivity = 1,
			fuel_inventory_size = 4,
			burnt_inventory_size = 4,
			smoke = {
				{
					name = "smoke",
					deviation = {0.25, 0.25},
					frequency = 20,
					position = {0, 0.5},
					height = 1,
					starting_frame = 0,
					starting_frame_deviation = 60,
				},
			},
			emissions_per_minute = data.raw.boiler.boiler.energy_source.emissions_per_minute,
		},
		energy_source = {
			type = "electric",
			usage_priority = "primary-output",
			buffer_capacity = "1MJ",
			drain = "0W",
		},
		power = "200kW",
		--[[ For comparison:
		Solar panel is 30kW for 1 tile.
		Portable fission reactor is 750kW for 4x4, so 46.875kW per tile.
		Portable fusion reactor is 2.5MW for 4x4, so 156.25kW per tile.
		So if we make this say 25kW per tile, it's 4*2*25kW = 200kW total.
		]]
		categories = {"armor"},
	}, {
		type = "item",
		name = "personal-burner-generator",
		icon = "__PersonalBurnerGenerator__/graphics/item.png",
		icon_size = 64,
		place_as_equipment_result = "personal-burner-generator",
		subgroup = "equipment",
		order = "a[energy-source]-0[personal-burner-generator]",
		stack_size = 20,
		drop_sound = data.raw.item["flamethrower-turret"].drop_sound,
		open_sound = data.raw.item["flamethrower-turret"].open_sound,
		pick_sound = data.raw.item["flamethrower-turret"].pick_sound,
		close_sound = data.raw.item["flamethrower-turret"].close_sound,
		inventory_move_sound = data.raw.item["flamethrower-turret"].inventory_move_sound,
	}, {
		type = "recipe",
		name = "personal-burner-generator",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
			{type = "item", name = "copper-cable", amount = 8},
			{type = "item", name = "steel-plate", amount = 20},
			{type = "item", name = "advanced-circuit", amount = 2},
		},
		results = {{type = "item", name = "personal-burner-generator", amount = 1}},
	}
}

-- Add to tech.
if data.raw.technology["modular-armor"] == nil then
	data.raw.recipe["personal-burner-generator"].enabled = true
else
	table.insert(data.raw.technology["modular-armor"].effects, {type = "unlock-recipe", recipe = "personal-burner-generator"})
end