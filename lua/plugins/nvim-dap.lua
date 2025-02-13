return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"nvim-neotest/nvim-nio",
		},
		config = function(_, opts)
			vim.keymap.set("n", "<F5>", function()
				require("dap").continue()
			end, { desc = "Continue" })
			vim.keymap.set("n", "<F10>", function()
				require("dap").step_over()
			end, { desc = "Step over" })
			vim.keymap.set("n", "<F11>", function()
				require("dap").step_into()
			end, { desc = "Step into" })
			vim.keymap.set("n", "<F12>", function()
				require("dap").step_out()
			end, { desc = "Step out" })
			-- vim.keymap.set("n", "<Leader>dr", function()
			-- 	require("dap").repl.open()
			-- end, { desc = "REPL" })
			vim.keymap.set("n", "<Leader>dl", function()
				require("dap").run_last()
			end, { desc = "Run [L]ast debug" })
			vim.keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle [B]reakpoint" })
			vim.keymap.set("n", "<leader>dx", "<cmd> DapTerminate <CR>", { desc = "Debug [X]Terminate" })
			vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
				require("dap.ui.widgets").hover()
			end, { desc = "Evaluate [H]over" })
			vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
				require("dap.ui.widgets").preview()
			end, { desc = "[P]review widgets" })
			vim.keymap.set("n", "<Leader>df", function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.frames)
			end, { desc = "Center [F]rames" })
			vim.keymap.set("n", "<Leader>ds", function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.scopes)
			end, { desc = "Center [S]copes" })
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function(_, opts)
			require("mason-tool-installer").setup({
				ensure_installed = { "debugpy" },
			})
			local function mason_package_path(package)
				local path = vim.fn.resolve(vim.fn.stdpath("data") .. "/mason/packages/" .. package)
				return path
			end

			local path = mason_package_path("debugpy") .. "/venv/Scripts/python"
			require("dap-python").setup(path)

			vim.keymap.set("n", "<leader>dt", function()
				require("dap-python").test_method()
			end, { desc = "Debug [T]est" })
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
}
