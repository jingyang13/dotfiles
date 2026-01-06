return {
  'stevearc/conform.nvim',
  opts = {
    -- 可以在这里添加一些通用配置，例如：
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      lua = { "stylua" },
      -- 现代 Web 开发通常首选 prettierd (速度更快) 或 prettier
      javascript = { "prettierd", "prettier", stop_after_first = true },
      css = { "prettierd", "prettier", stop_after_first = true },
      html = { "prettierd", "prettier", stop_after_first = true },
      -- Bash 通常使用 shfmt
      sh = { "shfmt" },
      bash = { "shfmt" },
    },
  },
}
