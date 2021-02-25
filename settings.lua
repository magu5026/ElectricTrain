data:extend({
	{
		type = "bool-setting",
		name = "mk-train",
		setting_type = "startup",
		default_value = true,
	},
	{
		type = "bool-setting",
		name = "mk-cargo",
		setting_type = "startup",
		default_value = true,
	},
	{
		type = "bool-setting",
		name = "mk-fluid",
		setting_type = "startup",
		default_value = true,
	},
	{
		type = "int-setting",
		name = "mk-update-interval",
		setting_type = "startup",
		default_value = 60,
		minimum_value = 2,
	},
})