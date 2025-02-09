-- Lua
return {
	"folke/zen-mode.nvim",
	opts = {
		window = {
			width = 0.90,
		},
		plugins = {
			options = {
				laststatus = 3, -- turn on the statusline in zen mode
			},
			lualine = { enabled = true }, -- enable to start Twilight when zen mode opens
		},
	},
	config = function()
		local zen_mode = require("zen-mode")
		zen_mode.setup()
		vim.keymap.set("n", "<leader>z", function()
			zen_mode.toggle()
		end, { desc = "Zen mode" })
	end,
}
