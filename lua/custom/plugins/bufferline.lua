return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				themable = true,
				diagnostics = "nvim_lsp",

				groups = {
					options = {
						toggle_hidden_on_enter = true,
					},
					items = {
						{
							name = "Unit-Env",
							highlight = { sp = "#5996f7" },
							priority = 1,
							matcher = function(buf)
								return buf ~= nil and buf.path and string.find(buf.path, "unit%-env") ~= nil
							end,
							auto_close = true,
						},
						{
							name = "Unit-Core",
							highlight = { sp = "#f2cd66" },
							priority = 2,
							matcher = function(buf)
								return buf ~= nil and buf.path and string.find(buf.path, "unit%-core") ~= nil
							end,
							auto_close = true,
						},
						{
							name = "Unit-CrossDcc",
							highlight = { sp = "#f7ad59" },
							priority = 3,
							matcher = function(buf)
								return buf ~= nil and buf.path and string.find(buf.path, "unit%-crossdcc") ~= nil
							end,
							auto_close = true,
						},
						{
							name = "Unit-Tools",
							highlight = { sp = "#bf8fcc" },
							priority = 4,
							matcher = function(buf)
								return buf ~= nil and buf.path and string.find(buf.path, "unit%-tools") ~= nil
							end,
							auto_close = true,
						},
						{
							name = "Unit-Dcc",
							highlight = { sp = "#f75959" },
							priority = 5,
							matcher = function(buf)
								return buf ~= nil and buf.path and string.find(buf.path, "unit%-dcc") ~= nil
							end,
							auto_close = true,
						},
						{
							name = "Unit-Docker-Pipe",
							highlight = { sp = "#66bdb3" },
							priority = 6,
							matcher = function(buf)
								return buf ~= nil and buf.path and string.find(buf.path, "unit%-docker%-pipe") ~= nil
							end,
							auto_close = true,
						},
					},
				},
			},
		})
	end,
}
