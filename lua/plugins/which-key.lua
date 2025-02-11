return { -- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	event = "VimEnter", -- Sets the loading event to 'VimEnter'
	config = function() -- This is the function that runs, AFTER loading
		require("which-key").setup()

		-- Document existing key chains
		require("which-key").add({
			{ "", group = "[C]ode" },
			{ "<leader>b", group = "[B]uffers" },
			{ "<leader>c", group = "Git [C]onflict" },
			{ "<leader>d", group = "[d]ebug" },
			{ "<leader>D", group = "[D]ocument" },
			{ "<leader>h", group = "Git [H]unk" },
			{ "<leader>r", group = "[R]ename" },
			{ "<leader>s", group = "[S]earch" },
			{ "<leader>t", group = "[T]rouble" },
			{ "<leader>u", group = "C[U]rsor" },
			{ "<leader>v", group = "[V]irtualEnv" },
			{ "<leader>w", group = "[W]orkspace" },
			{ "<leader>y", group = "[Y]azi" },
		})
	end,
}
