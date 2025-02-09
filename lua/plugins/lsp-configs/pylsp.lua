return {
	pylsp = {
		plugins = {
			ruff = {
				enabled = true,
				formatEnabled = true,
			},
		},
		pylsp_mypy = {
			enabled = false,
			strict = true,
			report_progress = true,
			["follow-imports"] = "normal",
			-- overrides = {
			-- 	"true",
			-- 	"--follow-imports",
			-- 	"silent",
			-- },
		},
		jedi_completion = { fuzzy = "true" },
	},
}
