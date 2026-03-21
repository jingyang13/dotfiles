return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" }, -- 延迟加载，提高启动速度
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		-- 如果你想彻底禁用自动保存，注释掉下面这段
		-- format_on_save = {
		--     timeout_ms = 2000,
		--     lsp_fallback = true,
		-- },
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
			css = { "prettierd", "prettier", stop_after_first = true },
			html = { "prettierd", "prettier", stop_after_first = true },
			json = { "biome", "prettierd", "prettier", stop_after_first = true },
			jsonc = { "biome", "prettierd", "prettier", stop_after_first = true },
			sh = { "shfmt" },
			rust = { "ast-grep" },
			bash = { "shfmt" },
		},
	},
}
