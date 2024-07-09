return {
	"ahmedkhalf/project.nvim",
	config = function()
		require("project_nvim").setup({
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			patterns = {
				"=c:/Users/paul.charmoille/unit-image/source/",
				"=c:/Users/paul.charmoille/AppData/Local/nvim",
			},
			exclude_dirs = { "c:" },
			-- patterns = { ">source" },
			require("telescope").load_extension("projects"),
		})
	end,
}
