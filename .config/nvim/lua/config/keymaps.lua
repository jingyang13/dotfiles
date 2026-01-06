vim.g.mapleader = " "

local keymap = vim.keymap

vim.keymap.set('n', '<leader>st', '40:split | terminal<CR>', {
    noremap = true,
    silent = true,
    desc = '垂直分割并打开一个 40 列的终端'
})



-- 必须设置，否则 ufo 无法正常工作
vim.opt.foldcolumn = '1' -- '0' 则不显示左侧折叠栏
vim.opt.foldlevel = 99   -- 默认展开所有折叠
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- 增强 UI 显示（可选）
vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

