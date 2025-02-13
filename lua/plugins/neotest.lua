return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-neotest/neotest-python",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-python")({
					dap = { justMyCode = false },
				}),
			},
		})
		local neotest = require("neotest")
		vim.keymap.set("n", "<leader>Tn", function()
			neotest.run.run()
		end, { desc = "Run [n]earest test" })
		vim.keymap.set("n", "<leader>Tf", function()
			neotest.run.run(vim.fn.expand("%"))
		end, { desc = "[T]est current [file]" })
	end,
}
