return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			themes = { "gruvbox", "tokyonight", "everforest", "catppuccin" },
			livePreview = true,
		})
	end,
}
