return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
		vim.g.gruvbox_material_enable_italic = true
		require("gruvbox").setup({})
	end,
}
