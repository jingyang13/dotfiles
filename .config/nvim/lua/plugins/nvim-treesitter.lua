-- 首先设置 .yuck 文件类型
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.yuck",
  callback = function()
    vim.bo.filetype = "scheme"  -- 使用 scheme 而不是 lisp，因为 scheme 解析器通常更可靠
  end,
})

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = function(plugin)
      -- 先运行 TSUpdate
      vim.cmd("TSUpdate")
      -- 确保安装 scheme 解析器（比 lisp 更稳定）
      vim.defer_fn(function()
        vim.cmd("TSInstall scheme")
        vim.cmd("TSInstall query")
      end, 100)
    end,
    
    event = "VeryLazy",
    
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
          -- 如果 treesitter 不支持，使用 vim 的正则高亮作为回退
          additional_vim_regex_highlighting = true,
        },
        
        indent = { enable = true },
        
        -- 使用 scheme 作为 Lisp 文件的解析器
        ensure_installed = {
          "scheme",      -- 用于 .yuck 文件
          "c",
          "lua",
          "python",
          "bash",
          "json",
          "markdown",
          "vim",
          "query",       -- treesitter 查询语言，必须安装
        },
        
        auto_install = true,
      })
      
      -- 为 .yuck 文件手动设置解析器
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "scheme",
        callback = function(args)
          local filename = vim.api.nvim_buf_get_name(args.buf)
          if filename:match("%.yuck$") then
            -- 尝试使用 scheme 解析器
            local has_scheme = pcall(vim.treesitter.language.add, "yuck", "scheme")
            if has_scheme then
              vim.bo[args.buf].syntax = "scheme"
            end
          end
        end,
      })
    end,
  },
}
