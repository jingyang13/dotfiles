vim.opt.termguicolors = true -- 开启终端颜色
-- vim.cmd.colorscheme("habamax") -- 主题颜色

vim.opt.number = true -- 行数
vim.opt.relativenumber = true -- 相对行数
vim.opt.cursorline = true -- 当前行高亮
vim.opt.wrap = false -- 不换行
vim.opt.scrolloff = 10 -- 保留上方和下方 10 行内容
vim.opt.sidescrolloff = 10 -- 保留制表符或退格操作时左侧 10 行内容

vim.opt.tabstop = 2 -- 制表符宽度
vim.opt.shiftwidth = 2 -- 缩进宽度
vim.opt.softtabstop = 2 -- 软制表位（按 Tab/Backspace 时不会产生真正的制表符）
vim.opt.expandtab = true -- 使用空格代替制表符
vim.opt.smartindent = true -- 智能自动缩进
vim.opt.autoindent = true -- 从当前行复制缩进
vim.opt.ignorecase = true -- 不区别大小写搜索
vim.opt.smartcase = true -- 智能大小写 小写不区别大小写 大写区分大小写
vim.opt.hlsearch = false -- 高亮搜索结果
vim.opt.incsearch = true -- 增量搜索

vim.opt.signcolumn = "yes" -- 始终显示符号列（用于诊断、Git 标记等）
vim.opt.colorcolumn = "100" -- 在第 100 个字符位置显示一条竖线（代码长度提示）
vim.opt.showmatch = true -- 高亮匹配的括号
vim.opt.cmdheight = 1 -- 命令行区域高度为 1 行
vim.opt.completeopt = "menu,noinsert,noselect,popup" -- 补全选项：显示菜单、不自动插入、不自动选中
-- vim.opt.showmode = false -- 不显示模式文字（如 -- INSERT --），改为在状态栏显示

vim.opt.pumheight = 10 -- 弹出补全菜单的最大高度（10 行）
vim.opt.pumblend = 10 -- 弹出菜单透明效果
vim.opt.winblend = 0 -- 浮动窗口透明度（0 = 完全不透明）
vim.opt.conceallevel = 0 -- 不隐藏标记文本（如 Markdown 的 `**bold**` 不隐藏成 bold）
vim.opt.concealcursor = "" -- 不在光标所在行隐藏标记语法
vim.opt.lazyredraw = true -- 宏执行期间不重绘屏幕（提升性能）
vim.opt.synmaxcol = 300 -- 超过 300 列后不再进行语法高亮（性能优化）
vim.opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ", -- 隐藏空行的"~"
}

local undodir = vim.fn.expand("~/.vim/undodir")
if
	vim.fn.isdirectory(undodir) == 0 --  如果未存在，则创建 undodir 目录
then
	vim.fn.mkdir(undodir, "p")
end

vim.opt.backup = false -- 不创建备份文件 do not create a backup file
vim.opt.writebackup = false --  不要写入备份文件
vim.opt.swapfile = false -- 不创建一个交换文件
vim.opt.undofile = true -- 创建一个 undo 文件
vim.opt.undolevels = 10000 -- 撤销历史深度
vim.opt.undodir = undodir -- 设置 undo 目录
vim.opt.updatetime = 300 -- 提高补全/触发响应速度 (默认是 4000ms)
vim.opt.timeoutlen = 500 -- 快捷键序列等待超时时间 (毫秒)
vim.opt.ttimeoutlen = 0 -- 键盘代码(如方向键、Esc)的超时时间
vim.opt.autoread = true -- Neovim 外部被修改，自动重新加载
vim.opt.autowrite = true -- 自动保存

vim.opt.hidden = true -- 允许隐藏缓冲区
vim.opt.errorbells = false -- 关闭错误提示音
vim.opt.backspace = "indent,eol,start" -- 优化退格键（Backspace）行为
vim.opt.autochdir = false -- 不要自动切换工作目录
vim.opt.iskeyword:append("-") -- include - 将 "-" 包含在单词中
vim.opt.path:append("**") -- 模糊搜索时包含子目录
vim.opt.selection = "inclusive" -- 选择时包含最后一个字符
vim.opt.mouse = "a" -- 开启鼠标支持
vim.opt.clipboard:append("unnamedplus") -- 共享系统剪贴板
vim.opt.modifiable = true -- 允许修改缓冲区内容
vim.opt.encoding = "utf-8" -- 设置编码格式

-- vim.opt.guicursor =
-- "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
-- 光标闪烁及设置

-- Folding: requires treeSitter available at runtime; safe fallback if not
vim.opt.foldmethod = "expr" -- 使用表达式进行折叠
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- 使用 treesitter 计算折叠
vim.opt.foldlevel = 99 -- 默认打开所有折叠

vim.opt.splitbelow = true -- 水平分割会位于下方
vim.opt.splitright = true -- 垂直分割会位于右侧
vim.opt.splitkeep = "screen"

vim.opt.wildmenu = true -- 开启命令行菜单补全
vim.opt.wildmode = "longest:full,full" -- 命令行补全的匹配模式
vim.opt.diffopt:append("linematch:60") -- 优化代码差异（diff）对比显示
vim.opt.redrawtime = 10000 -- 提高界面重绘的容忍时间（毫秒)
vim.opt.maxmempattern = 20000 -- 提高正则表达式匹配的最大内存

-- 退出插入模式时，自动将 Rime 切换到英文模式

-- 统一定义切换 Rime 英文模式的函数
local function set_rime_ascii()
	vim.fn.jobstart({
		"dbus-send",
		"--session",
		"--print-reply",
		"--dest=org.fcitx.Fcitx5",
		"/rime",
		"org.fcitx.Fcitx.Rime1.SetAsciiMode",
		"boolean:true",
	}, { detach = true })
end

-- 创建一个独立的自动命令组，方便重载和管理
local fcitx_group = vim.api.nvim_create_augroup("FcitxSmartSwitch", { clear = true })

-- 1. 退出插入模式时，切换到英文
vim.api.nvim_create_autocmd("InsertLeave", {
	group = fcitx_group,
	pattern = "*",
	callback = set_rime_ascii,
})

-- 2. 刚进入 Neovim (VimEnter) 时，自动切到英文
vim.api.nvim_create_autocmd("VimEnter", {
	group = fcitx_group,
	pattern = "*",
	callback = set_rime_ascii,
})

-- 3. 针对特定的文件类型/缓冲区（如 :Ex Netrw, ToggleTerm, Lazy 等）自动切英文
vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
	group = fcitx_group,
	pattern = "*",
	callback = function()
		-- 获取当前缓冲区的 filetype 和 buftype
		local ft = vim.bo.filetype
		local bt = vim.bo.buftype

		-- 需要强制英文的名单
		-- netrw 是 :Ex 的文件类型；Telescope/lazy/mason 是常见的插件窗口
		local ignore_fts = { "netrw", "TelescopePrompt", "lazy", "mason", "toggleterm" }
		local ignore_bts = { "terminal", "nofile", "quickfix" }

		if vim.tbl_contains(ignore_fts, ft) or vim.tbl_contains(ignore_bts, bt) then
			set_rime_ascii()
		end
	end,
})

-- 对 markdown 和文本文件进行换行和拼写检查操作 并且不会单词边界换行
vim.api.nvim_create_autocmd("FileType", {
	group = fcitx_group,
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.spell = true
	end, -- 这里需要闭合 callback 函数
}) -- 这里需要闭合 nvim_create_autocmd 调用

-- 视觉/UI 相关
vim.opt.matchtime = 2 -- 显示匹配括号的时间
vim.opt.pummaxwidth = 60 -- 限制补全弹窗最大宽度
vim.opt.confirm = true -- 退出前确认保存
vim.opt.ruler = false -- 禁用默认标尺
vim.opt.virtualedit = "block" -- 可视块模式下允许光标移动到无文本区域
vim.opt.winminwidth = 5 -- 最小窗口宽度
vim.opt.smoothscroll = false -- 平滑滚动
vim.opt.winborder = "rounded" -- 浮动窗口圆角边框
vim.opt.pumborder = "rounded" -- 补全菜单圆角边框
vim.opt.messagesopt = "hit-enter,history:500,progress:c" -- 消息选项
vim.opt.jumpoptions = "view" -- 跳转选项
vim.opt.linebreak = true -- 在合适位置换行
vim.opt.list = false -- 显示不可见字符
vim.opt.shiftround = true -- 缩进取整
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true }) -- 缩短消息

-- grep 设置
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
