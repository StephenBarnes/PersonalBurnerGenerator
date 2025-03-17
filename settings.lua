data:extend {
	{
		type = "int-setting",
		name = "personal-burner-generator-power-output",
		setting_type = "startup",
		default_value = 200,
		--[[
			For comparison:
			Solar panel is 30kW for 1 tile.
			Portable fission reactor is 750kW for 4x4, so 46.875kW per tile.
			Portable fusion reactor is 2.5MW for 4x4, so 156.25kW per tile.
			So if we make this say 25kW per tile, it's 4*2*25kW = 200kW total.
		]]
		minimum_value = 1,
	},
	{
		type = "int-setting",
		name = "personal-burner-generator-pollution-output",
		setting_type = "startup",
		default_value = -1,
		minimum_value = -1,
	},
	{
		type = "double-setting",
		name = "personal-burner-generator-fuel-efficiency",
		setting_type = "startup",
		default_value = 1.0,
		minimum_value = 0.01,
	},
	{
		type = "int-setting",
		name = "personal-burner-generator-burner-inventory-size",
		setting_type = "startup",
		default_value = 4,
		minimum_value = 1,
		maximum_value = 4,
	},
}
