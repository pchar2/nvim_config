return {
	"folke/trouble.nvim",
	opts = {
		auto_refresh = false,
	}, -- for default options, refer to the configuration section for custom setup.
	auto_refresh = false,
	cmd = "Trouble",
	keys = {
		{
			"<leader>tx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>tX",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>tL",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location List (Trouble)",
		},
		{
			"<leader>tQ",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
	},
	modes = {
		preview_float = {
			mode = "diagnostics",
			preview = {
				type = "float",
				relative = "editor",
				border = "rounded",
				title = "Preview",
				title_pos = "center",
				position = { 0, -2 },
				size = { width = 0.3, height = 0.3 },
				zindex = 200,
			},
		},
	},
}
