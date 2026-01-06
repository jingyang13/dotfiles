```
nvim/
├── init.lua                    # Neovim主入口文件，通常用来加载其他配置模块
├── lazy-lock.json              # lazy.nvim插件管理器生成的锁文件，记录插件版本
├── lsp                         # LSP配置目录
│   └── lua_ls.lua              # Lua语言的LSP配置（用于Lua语言服务器）
└── lua                         # Lua模块目录（Neovim会自动加载此目录下的lua模块）
    ├── config                  # 基础配置模块
    │   ├── basic.lua           # 基础设置（如行号、缩进、搜索等选项）
    │   ├── keymaps.lua         # 快捷键映射配置
    │   ├── lazy.lua            # lazy.nvim插件管理器初始化配置
    │   └── lsp.lua             # LSP通用配置（Mason、LSP基础设置等）
    └── plugins                 # 各插件独立配置文件
        ├── blink-cmp.lua       # 自动补全插件 (可能是nvim-cmp或其变体)
        ├── bufferline.lua      # 顶部标签页/缓冲区显示插件
        ├── colorscheme.lua     # 主题/颜色方案配置
        ├── conform.lua         # 代码格式化插件 (替代null-ls)
        ├── dashboard.lua       # 启动面板/仪表板插件
        ├── hop.lua             # 快速跳转插件 (类似easymotion)
        ├── Indent-Blankline.lua # 缩进参考线显示插件
        ├── lualine.lua         # 状态栏插件
        ├── mason.lua           # LSP、DAP、Linter管理器
        ├── nvim-autopairs.lua  # 自动括号补全插件
        ├── nvim-colorizer.lua  # 颜色代码高亮显示插件
        ├── nvim-telescope.lua  # 模糊查找器插件 (文件、内容搜索等)
        ├── nvim-tree.lua       # 文件树侧边栏插件
        ├── nvim-treesitter.lua # 语法高亮增强插件
        ├── nvim-ufo.lua        # 代码折叠插件
        └── render-markdown.lua # Markdown渲染插件
```
