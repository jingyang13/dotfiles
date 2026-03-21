return {
	"saghen/blink.cmp",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = { "L3MON4D3/LuaSnip" },
	version = "1.*",
	opts = {
		keymap = { preset = "super-tab" },
		snippets = {
			preset = "luasnip",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
	},
}
