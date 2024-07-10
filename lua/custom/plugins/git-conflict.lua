-- https://github.com/akinsho/git-conflict.nvim
return {
	"akinsho/git-conflict.nvim",
	version = "2.0.0",
	opts = {
		default_mappings = true, -- disable buffer local mapping created by this plugin
		default_commands = true, -- disable commands created by this plugin
		disable_diagnostics = true, -- This will disable the diagnostics in a buffer whilst it is conflicted
	},
}
