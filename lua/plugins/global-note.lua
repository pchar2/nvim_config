return {
	"backdround/global-note.nvim",
	config = function()
		local global_note = require("global-note")
		local options = {
			-- A nvim_open_win config to show float window.
			-- table or fun(): table
			window_config = function()
				local window_height = vim.api.nvim_list_uis()[1].height
				local window_width = vim.api.nvim_list_uis()[1].width
				return {
					relative = "editor",
					border = "single",
					title = "Note",
					title_pos = "center",
					width = math.floor(0.7 * window_width),
					height = math.floor(0.85 * window_height),
					row = math.floor(0.05 * window_height),
					col = math.floor(0.15 * window_width),
				}
			end,
			autosave = true,
		}
		global_note.setup(options)

		vim.keymap.set("n", "<leader>n", global_note.toggle_note, {
			desc = "Toggle global [N]ote",
		})
	end,
}
