-- Lua
return {
	"folke/zen-mode.nvim",
	config = function()
		local opts = {
			window = {
				width = 0.70,
			},
			plugins = {
				options = {
					laststatus = 3, -- turn on the statusline in zen mode
				},
				lualine = { enabled = true }, -- enable to start Twilight when zen mode opens
			},
		}
		local zen_mode = require("zen-mode")
		zen_mode.setup(opts)
		vim.keymap.set("n", "<leader>z", function()
			zen_mode.toggle()
		end, { desc = "Zen mode" })
	end,
}
