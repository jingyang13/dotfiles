```
~/.config/nvim/
├── init.lua                # Neovim 入口文件，相当于 main
├── lazy-lock.json          # lazy.nvim 自动生成的插件锁定文件
├── lsp/
│   └── lua_ls.lua          # Lua Language Server（lua_ls）的单独配置
├── lua/                    # 所有 Lua 模块目录（require 都从这里开始）
│   ├── config/             # 核心配置（不直接属于某个插件）
│   │   ├── basic.lua       # 基础设置
│   │   ├── keymaps.lua     # 全局快捷键映射
│   │   ├── lazy.lua        # lazy.nvim 本身的初始化与配置
│   │   └── lsp.lua         # LSP 通用配置
│   │
│   └── plugins/            # 所有插件的配置（lazy.nvim 会扫描这里）
│       ├── blink-cmp.lua   # 自动补全（blink.cmp）
│       ├── bufferline.lua  # 顶部 Buffer 标签栏
│       ├── colorscheme.lua # 主题配置
│       ├── conform.lua     # 代码格式化工具
│       ├── hop.lua         # 快速跳转插件（Hop）
│       ├── Indent-Blankline.lua # 缩进辅助线（indent-blankline / ibl）
│       ├── lualine.lua     # 状态栏（底部）
│       ├── mason.lua       # LSP / DAP / Formatter 安装管理器
│       ├── nvim-autopairs.lua # 自动补全括号、引号
│       ├── nvim-colorizer.lua # 颜色高亮（#fff / rgb / hsl）
│       ├── nvim-telescope.lua # 模糊搜索（文件 / grep / buffers）
│       ├── nvim-tree.lua   # 文件树
│       ├── nvim-treesitter.lua # 语法高亮 / 代码结构
│       ├── nvim-ufo.lua    # 折叠增强（基于 Treesitter / LSP）
│       ├── render-markdown.lua # Markdown 渲染（接近 Typora）
│       └── dashboard.lua  # 启动页（Dashboard）
```

# `lsp` 所需的依赖

```bash
sudo pacman -S npm
sudo pacman -S unzip
sudo pacman -S unixodbc
```
