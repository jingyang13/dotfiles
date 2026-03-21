return {
	"L3MON4D3/LuaSnip",
	lazy = true,
	build = "make install_jsregexp",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	config = function()
		-- 加载类似 VSCode 的代码片段库 (friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		-- 可选：如果你想从某个特定目录加载自定义片段
		-- require("luasnip.loaders.from_lua").load({ paths = "./snippets" })
	end,
}
