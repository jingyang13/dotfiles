return {
	"catppuccin/nvim", -- 插件的 GitHub 仓库名
	name = "catppuccin",
	priority = 1000, -- 确保主题在所有其他插件之前加载
	config = function()
		-- 在这里调用插件的 setup 函数
		require("catppuccin").setup({
			flavour = "macchiato", -- 或 latte, frappe, mocha
			background = {},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
