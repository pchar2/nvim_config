return {
	"L3MON4D3/LuaSnip",
	config = function()
		require("luasnip").setup()
		local ls = require("luasnip")
		local s = ls.snippet
		local t = ls.text_node
		local i = ls.insert_node
		ls.add_snippets("python", {
			s("doc", {
				t('"""'),
				i(1),
				t('"""'),
			}),
		})
	end,
}
