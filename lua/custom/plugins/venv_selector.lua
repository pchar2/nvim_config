return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-dap",
		"mfussenegger/nvim-dap-python", --optional
		{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
	},
	lazy = false,
	branch = "regexp", -- This is the regexp branch, use this for the new version
	config = function()
		local function shorter_name(filename)
			-- Escape path to use special chars in gsub
			local function regexEscape(str)
				return str:gsub("[%(%)%.%%%+%-%*%?%[%^%$%]]", "%%%1")
			end

			filename = string.gsub(string.lower(filename), regexEscape(string.lower(vim.loop.os_homedir() or "")), ".")

			return filename
		end

		local function on_venv_activate()
			local venv_python = require("venv-selector").python()
			local client = vim.lsp.get_clients({ name = "pylsp" })[1]
			local new_settings = {
				pylsp = {
					plugins = {
						pylsp_mypy = {
							overrides = {
								"--python-executable",
								venv_python,
								true,
							},
						},
					},
				},
			}
			local settings = vim.tbl_deep_extend("force", (client.settings or client.config.settings), new_settings)
			client.notify("workspace/didChangeConfiguration", { settings = settings })
		end

		require("venv-selector").setup({
			settings = {
				options = {
					on_venv_activate_callback = on_venv_activate,
					on_telescope_result_callback = shorter_name,
				},
			},
		})
	end,
	keys = {
		{ "<leader>vs", "<cmd>VenvSelect<cr>" },
	},
}
