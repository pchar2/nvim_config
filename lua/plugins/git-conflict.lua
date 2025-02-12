-- https://github.com/akinsho/git-conflict.nvim
return {
	"akinsho/git-conflict.nvim",
	version = "2.1.0",
	config = function()
		require("git-conflict").setup({
			default_mappings = false, -- disable buffer local mapping created by this plugin
			default_commands = true, -- disable commands created by this plugin
			disable_diagnostics = true, --  disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
			list_opener = "copen", -- command or function to open the conflicts list
			highlights = { -- They must have background color, otherwise the default color will be used
				incoming = "DiffAdd",
				current = "GitConflictCurrent",
			},
			vim.keymap.set("n", "<leader>co", "<cmd>GitConflictChooseOurs<cr>"),
			vim.keymap.set("n", "<leader>ct", "<cmd>GitConflictChooseTheirs<cr>"),
			vim.keymap.set("n", "<leader>cb", "<cmd>GitConflictChooseBoth<cr>"),
			vim.keymap.set("n", "<leader>cn", "<cmd>GitConflictChooseNone<cr>"),
			vim.keymap.set("n", "<leader>cc", "<cmd>GitConflictNextConflict<cr>"),
			vim.keymap.set("n", "<leader>cp", "<cmd>GitConflictPrevConflict<cr>"),
			vim.keymap.set("n", "<leader>cl", "<cmd>GitConflictListQf<cr>"),
			vim.api.nvim_set_hl(
				vim.api.nvim_get_hl_id_by_name("GitConflictCurrent"),
				"Normal",
				{ fg = "#ffffff", bg = "#333333" }
			),
			debug = false,
		})
	end,
}
