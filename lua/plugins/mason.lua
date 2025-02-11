return {
	{
		"williamboman/mason.nvim",
		config = true,
		init = function(_)
			local pylsp = require("mason-registry").get_package("python-lsp-server")
			pylsp:on("install:success", function()
				local function mason_package_path(package)
					local path = vim.fn.resolve(vim.fn.stdpath("data") .. "/mason/packages/" .. package)
					return path
				end

				local path = mason_package_path("python-lsp-server")
				local command = path .. "/venv/Scripts/pip"
				local args = {
					"install",
					"-U",
					"python-lsp-ruff",
					"pyls-memestra",
					-- "pylsp-mypy",
				}

				require("plenary.job")
					:new({
						command = command,
						args = args,
						cwd = path,
					})
					:start()
			end)
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
	},
}
