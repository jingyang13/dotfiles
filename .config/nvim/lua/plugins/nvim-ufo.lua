return {
    {
        "kevinhwang91/nvim-ufo",
        dependencies = { "kevinhwang91/promise-async" },
        config = function()
            -- 折叠预览快捷键：在折叠行按 K 查看预览
            vim.keymap.set('n', 'K', function()
                local winid = require('ufo').peekFoldedLinesUnderCursor()
                if not winid then
                    vim.lsp.buf.hover()
                end
            end, { desc = "LSP Hover or Peek Fold" })

            require("ufo").setup({
                provider_selector = function(bufnr, filetype, buftype)
                    -- 使用 treesitter 作为折叠选择器
                    return { "treesitter", "indent" }
                end,
            })
        end,
    },
}
