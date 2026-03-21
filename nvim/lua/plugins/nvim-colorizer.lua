-- lua/plugins/nvim-colorizer.lua
return {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre", -- 在读取文件前加载，提高性能
    config = function()
        require("colorizer").setup({
            filetypes = { "*" }, -- 对所有文件类型生效
            user_default_options = {
                RGB = true,          -- #RGB 格式
                RRGGBB = true,       -- #RRGGBB 格式
                names = true,        -- "Red", "Blue" 等颜色名称
                RRGGBBAA = true,     -- #RRGGBBAA 格式
                AARRGGBB = true,     -- 0xAARRGGBB 格式
                rgb_fn = true,       -- CSS rgb() 和 rgba() 函数
                hsl_fn = true,       -- CSS hsl() 和 hsla() 函数
                css = true,          -- 启用所有 CSS 颜色属性
                css_fn = true,       -- 启用所有 CSS 函数
                -- 模式：'background' (背景色), 'foreground' (前景色), 'virtualtext' (虚拟文本)
                mode = "background", 
                tailwind = true,     -- 支持 Tailwind CSS 色块
            },
        })
    end,
}
