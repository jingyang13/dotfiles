return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			config = {

				-- 关闭 week header，让整体更紧凑
				week_header = {
					enable = false,
				},

				-- 自定义字符画（小号 JINGYANG）
				header = {
					"",
					"   ██╗██╗███╗   ██╗ ██████╗ ██╗   ██╗ █████╗ ███╗   ██╗ ██████╗ ",
					"   ██║██║████╗  ██║██╔════╝ ╚██╗ ██╔╝██╔══██╗████╗  ██║██╔════╝ ",
					"   ██║██║██╔██╗ ██║██║  ███╗ ╚████╔╝ ███████║██╔██╗ ██║██║  ███╗",
					"   ██║██║██║╚██╗██║██║   ██║  ╚██╔╝  ██╔══██║██║╚██╗██║██║   ██║",
					"   ██║██║██║ ╚████║╚██████╔╝   ██║   ██║  ██║██║ ╚████║╚██████╔╝",
					"   ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ",
					"",
				},

				shortcut = {
					{ desc = "󰊄 Update", group = "@property", action = "Lazy update", key = "u" },
					{
						icon = " ",
						icon_hl = "@variable",
						desc = "Files",
						group = "Label",
						action = "Telescope find_files",
						key = "f",
					},
					{
						icon = " ",
						desc = "Apps",
						group = "DiagnosticHint",
						action = "Telescope dotfiles",
						key = "a",
					},
					{
						icon = " ",
						desc = "Config",
						group = "Number",
						action = "edit $MYVIMRC",
						key = "c",
					},
				},
			},
		})
	end,
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
