local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- “Tab/Shift-Tab”：与浏览器标签栏类似，使用起来很自然
map("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })

-- 缓冲区切换
map("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

map("n", "<leader>bo", ":%bd|e#|bd#<CR>", { desc = "关闭其他 buffer，并只保留当前" })

map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- 快速切换到上次编辑的文件
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- ═══════════════════════════════════════════════════════════
-- 窗口管理（拆分与导航）
-- ═══════════════════════════════════════════════════════════

-- 在窗口之间切换
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- 调整窗口大小
-- map("n", "<C-S-Up>", "<cmd>resize +5<CR>", opts)
-- map("n", "<C-S-Down>", "<cmd>resize -5<CR>", opts)
-- map("n", "<C-S-Left>", "<cmd>vertical resize -5<CR>", opts)
-- map("n", "<C-S-Right>", "<cmd>vertical resize +5<CR>", opts)

-- 窗口分割
map("n", "<leader>ww", "<C-W>p", { desc = "Other Window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
map("n", "<leader>w-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>sh", "<C-W>s", { desc = "Split Window Below", remap = true })
-- map("n", "<leader>w|", "<C-W>v", { desc = "Split Window Right", remap = true })
-- map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>sv", "<C-W>v", { desc = "Split Window Right", remap = true })

-- ═══════════════════════════════════════════════════════════
-- 智能线性移动
-- ═══════════════════════════════════════════════════════════

-- 智能 j/k：无计数时按视觉行移动，有计数时按实际行移动。
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- 移动行
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- ═══════════════════════════════════════════════════════════
-- 搜索与导航
-- ═══════════════════════════════════════════════════════════

-- 行首/行尾
map("n", "gl", "$", { desc = "Go to end of line" })
map("n", "gh", "^", { desc = "Go to start of line" })
map("n", "<A-h>", "^", { desc = "Go to start of line", silent = true })
map("n", "<A-l>", "$", { desc = "Go to end of line", silent = true })

-- 选择全部内容
map("n", "==", "gg<S-v>G")
map("n", "<A-a>", "ggVG", { noremap = true, silent = true, desc = "Select all" })

-- 清除搜索高亮
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })
map(
	"n",
	"<leader>ur",
	"<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
	{ desc = "Redraw / Clear hlsearch / Diff Update" }
)

-- ═══════════════════════════════════════════════════════════
-- 智能文本编辑
-- ═══════════════════════════════════════════════════════════

-- 在缩进时保持可视化模式
map("v", "<", "<gv")
map("v", ">", ">gv")

-- 将整个文件复制到剪贴板
-- map("n", "<C-c>", ":%y+<CR>", opts)

-- 智能撤销断点
map("i", ",", ",<c-g>u")
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- 自动补全()
map("i", "`", "``<left>")
map("i", '"', '""<left>')
map("i", "(", "()<left>")
map("i", "[", "[]<left>")
map("i", "{", "{}<left>")
map("i", "<", "<><left>")

-- ═══════════════════════════════════════════════════════════
-- 文件操作
-- ═══════════════════════════════════════════════════════════

-- 保存文件
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- 创建新文件
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- ═══════════════════════════════════════════════════════════
-- 开发工具
-- ═══════════════════════════════════════════════════════════

-- 在当前行上方/下方添加注释
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- 全局列表 和 本地列表(窗口)
map("n", "<leader>xl", function()
	local success, err = pcall(vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 and vim.cmd.lclose or vim.cmd.lopen)
	if not success and err then
		vim.notify(err, vim.log.levels.ERROR)
	end
end, { desc = "Location List" })

map("n", "<leader>xq", function()
	local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
	if not success and err then
		vim.notify(err, vim.log.levels.ERROR)
	end
end, { desc = "Quickfix List" })

map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- ═══════════════════════════════════════════════════════════
-- 终端集成
-- ═══════════════════════════════════════════════════════════

-- 终端模式导航
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to Left Window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to Lower Window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to Upper Window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to Right Window" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- ═══════════════════════════════════════════════════════════
--  标签管理
-- ═══════════════════════════════════════════════════════════

map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- ═══════════════════════════════════════════════════════════
-- 折叠代码
-- ═══════════════════════════════════════════════════════════

--  关闭所有折叠只打开当前的
map("n", "zv", "zMzvzz", { desc = "Close all folds except the current one" })

-- Smart fold navigation (closes current, opens next/previous)
-- 关闭当前打开下一个/上一个折叠
map("n", "zj", "zcjzOzz", { desc = "Close current fold when open. Always open next fold." })
map("n", "zk", "zckzOzz", { desc = "Close current fold when open. Always open previous fold." })

-- ═══════════════════════════════════════════════════════════
-- 文件浏览
-- ═══════════════════════════════════════════════════════════
-- map("n", "-", "<cmd>Ex<cr>", { desc = "打开文件浏览" })
