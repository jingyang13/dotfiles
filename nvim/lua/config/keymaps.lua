vim.g.mapleader = " "

local keymap = vim.keymap

vim.keymap.set("n", "<leader>st", "40:split | terminal<CR>", {
	noremap = true,
	silent = true,
	desc = "垂直分割并打开一个 40 列的终端",
})

-- 必须设置，否则 ufo 无法正常工作
vim.opt.foldcolumn = "1" -- '0' 则不显示左侧折叠栏
vim.opt.foldlevel = 99 -- 默认展开所有折叠
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- 增强 UI 显示（可选）
vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- Ctrl + 方向键 切换窗口
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
