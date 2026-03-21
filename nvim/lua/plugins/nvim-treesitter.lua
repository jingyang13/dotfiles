return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			-- 解析器安装
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"query",
				"javascript",
				"typescript",
				"python",
				"go",
				"bash",
				"html",
				"css",
        "rust"
			},
			sync_install = false,
			auto_install = true,

			-- 核心模块配置
			highlight = {
				enable = true, -- 启用高亮
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true, -- 启用缩进
			},

			-- 增量选择 (非常实用)
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<CR>", -- 回车开始选择
					node_incremental = "<CR>", -- 回车扩大范围
					scope_incremental = "<TAB>", -- Tab 扩大到作用域
					node_decremental = "<BS>", -- 退格缩小范围
				},
			},
		})
	end,
}
