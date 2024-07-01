-- https://github.com/akinsho/toggleterm.nvim
return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		{
			"<leader>td",
			"<cmd>ToggleTerm size=40 direction=horizontal<cr>",
			desc = "Open a horizontal terminal at the Desktop directory",
		},
	},
	config = true,
}
