-- ===================================
-- 核心 Neovim/Vim 选项 (vim.opt)
-- ===================================
-- 1. 基本界面设置
vim.opt.encoding = "utf-8"       -- 使用 UTF-8 编码
vim.opt.termguicolors = true     -- 启用终端真彩色支持
vim.opt.mouse = "a"              -- 启用鼠标支持 (在所有模式下)
vim.opt.showmode = false         -- 不显示当前模式 (由插件如 lualine 处理)

-- 2. 行号和相对行号
vim.opt.number = true            -- 显示绝对行号
vim.opt.relativenumber = true    -- 显示相对行号 (方便移动)

-- 3. 缩进设置
vim.opt.tabstop = 2              -- Tab 键宽度设置为 4
vim.opt.shiftwidth = 2           -- 自动缩进时使用的空格数
vim.opt.expandtab = true         -- 将 Tab 键替换为 Space 键 (更通用)

-- 4. 搜索设置
vim.opt.ignorecase = true        -- 搜索时忽略大小写
vim.opt.smartcase = true         -- 如果搜索包含大写字母，则开启精确匹配
vim.opt.hlsearch = true          -- 高亮所有搜索结果

-- 5. 换行和撤销
vim.opt.wrap = false             -- 不自动换行 (如果一行很长，则水平滚动)
vim.opt.swapfile = false         -- 不使用交换文件 (更现代的 Neovim 做法)
vim.opt.backup = false           -- 不创建备份文件
vim.opt.undofile = true          -- 启用持久化撤销 (即使关闭文件也能撤销)

-- 6. UI/速度优化
vim.opt.updatetime = 300         -- 减少写入磁盘的延迟 (利于 LSPs/自动保存)
vim.opt.timeoutlen = 500         -- 等待键序列完成的毫秒数
vim.opt.scrolloff = 8            -- 滚动时，光标周围保留 8 行的上下文

vim.opt.clipboard = "unnamedplus"  -- 使用系统剪贴板
