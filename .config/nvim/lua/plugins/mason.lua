return {
  "williamboman/mason.nvim",
  event = "VeryLazy",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
  },

  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "html",
        "cssls",
      },
      automatic_installation = true,  -- ★ 自动安装缺失的 LSP ★

      handlers = {
        -- 默认 handler：所有 LSP 共享配置
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
            -- ★ 不写 filetypes，LSP 会根据默认 filetype 自动 lazy-load ★
          })
        end,

        ["lua_ls"] = function()
          require("lspconfig").lua_ls.setup({
            settings = {
              Lua = {
                workspace = { checkThirdParty = false },
                telemetry = { enable = false },
              },
            },
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
          })
        end,
      },
    })
  end,
}

--return {
--  "williamboman/mason.nvim",
--  event = {"Buf"},
--  opts = {},
--}
