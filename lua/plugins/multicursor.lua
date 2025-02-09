return {
	"jake-stewart/multicursor.nvim",
	branch = "1.0",
	config = function()
		local mc = require("multicursor-nvim")

		mc.setup()

		local set = vim.keymap.set

		-- Add or skip cursor above/below the main cursor.
		set({ "n", "v" }, "<up>", function()
			mc.lineAddCursor(-1)
		end)
		set({ "n", "v" }, "<down>", function()
			mc.lineAddCursor(1)
		end)

		-- Add or skip adding a new cursor by matching word/selection
		set({ "n", "v" }, "<C-n>", function()
			mc.matchAddCursor(1)
		end, { desc = "Add cursor under next match" })
		set({ "n", "v" }, "<C-p>", function()
			mc.matchAddCursor(-1)
		end, { desc = "Add cursor under previous match" })

		-- Add all matches in the document
		set({ "n", "v" }, "<leader>uaa", mc.matchAllAddCursors, { desc = "[A]dd cursor for [A]ll matching" })

		-- Rotate the main cursor.
		set({ "n", "v" }, "<left>", mc.nextCursor)
		set({ "n", "v" }, "<right>", mc.prevCursor)

		-- Add and remove cursors with control + left click.
		set("n", "<c-leftmouse>", mc.handleMouse)

		set("n", "<esc>", function()
			if not mc.cursorsEnabled() then
				mc.enableCursors()
			elseif mc.hasCursors() then
				mc.clearCursors()
			else
				vim.cmd.noh()
			end
		end)

		-- bring back cursors if you accidentally clear them
		set("n", "<leader>ur", mc.restoreCursors, { desc = "[R]estore cursors" })

		-- Append/insert for each line of visual selections.
		set("v", "I", mc.insertVisual)
		set("v", "A", mc.appendVisual)

		-- Customize how cursors look.
		local hl = vim.api.nvim_set_hl
		hl(0, "MultiCursorCursor", { link = "Cursor" })
		hl(0, "MultiCursorVisual", { link = "Visual" })
		hl(0, "MultiCursorSign", { link = "SignColumn" })
		hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
		hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
		hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
	end,
}
