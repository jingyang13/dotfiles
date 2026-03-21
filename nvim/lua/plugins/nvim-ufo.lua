return {
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		-- 1. 使用事件触发懒加载
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			-- 折叠预览快捷键：在折叠行按 K 查看预览
			vim.keymap.set("n", "K", function()
				local winid = require("ufo").peekFoldedLinesUnderCursor()
				if not winid then
					vim.lsp.buf.hover()
				end
			end, { desc = "LSP Hover or Peek Fold" })

			-- UFO 常用参数设置（推荐添加以增强体验）
			vim.o.foldcolumn = "1" -- '0' 则不显示折叠栏
			vim.o.foldlevel = 99 -- 默认展开所有折叠
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true

			require("ufo").setup({
				provider_selector = function(bufnr, filetype, buftype)
					-- 使用 treesitter 作为折叠选择器
					return { "treesitter", "indent" }
				end,
			})
		end,
	},
}
