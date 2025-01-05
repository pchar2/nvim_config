local function get_venv(variable)
	local venv = os.getenv(variable)
	if venv ~= nil and string.find(venv, "/") then
		local orig_venv = venv
		for w in orig_venv:gmatch("([^/]+)") do
			venv = w
		end
		venv = string.format("%s", venv)
	end
	return venv
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = { theme = "nightfly" },
			-- options = { theme = "gruvbox" },
			sections = {
				lualine_b = {
					{ "branch" },
					{
						"diff",
					},
					{
						"diagnostics",
					},
					{
						function()
							local venv = get_venv("VIRTUAL_ENV") or "N/A"
							if venv ~= "N/A" then
								-- truncate path
								local function regexEscape(str)
									return str:gsub("[%(%)%.%%%+%-%*%?%[%^%$%]]", "%%%1")
								end
								venv = string.gsub(
									string.lower(venv),
									regexEscape(string.lower(vim.loop.os_homedir() or "")),
									"."
								)
							end
							return " " .. venv
						end,
						cond = function()
							return vim.bo.filetype == "python"
						end,
						color = { fg = "black", bg = "#F1CA81" },
					},
				},
			},
		})
	end,
}
