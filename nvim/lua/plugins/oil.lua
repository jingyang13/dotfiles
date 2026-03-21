return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  lazy = false,
    keys = {
        { "-", "<cmd>Oil<cr>", desc = "打开oil"}
    }
}
