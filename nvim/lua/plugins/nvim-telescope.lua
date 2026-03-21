return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "Telescope",
  keys = {
    -- 🔍 文件搜索
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    -- 🔍 全局搜索 (ripgrep)
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    -- 🔍 最近文件
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
    -- 🔍 当前 buffer 内搜索
    { "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer Fuzzy Search" },
    -- 🔍 搜索 Neovim 配置
    { "<leader>fc", "<cmd>Telescope find_files cwd=~/.config/nvim<cr>", desc = "Search Config" },
  },

  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        -- 📌 预览窗口尺寸 (解决 1080p 才显示的问题)
        layout_config = {
          horizontal = {
            preview_width = 0.45, -- 默认 0.5，改小一点更易显示
          },
          vertical = {
            preview_height = 0.65,
          },
        },

        -- 🔇 禁用提示声和错误
        mappings = {
          i = {
            ["<esc>"] = actions.close,
          },
        },

        -- 忽略这些目录，提高速度
        file_ignore_patterns = {
          "node_modules", "dist", ".git",
        },

        -- 打开时先显示路径方式
        path_display = { "smart" },
      },
    })

    -- 启用 FZF 极快排序
    pcall(telescope.load_extension, "fzf")
  end,
}

