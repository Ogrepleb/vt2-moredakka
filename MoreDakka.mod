return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`MoreDakka` mod must be lower than Vermintide Mod Framework in your launcher's load order.")

		new_mod("MoreDakka", {
			mod_script       = "scripts/mods/MoreDakka/MoreDakka",
			mod_data         = "scripts/mods/MoreDakka/MoreDakka_data",
			mod_localization = "scripts/mods/MoreDakka/MoreDakka_localization",
		})
	end,
	packages = {
		"resource_packages/MoreDakka/MoreDakka",
	},
}
