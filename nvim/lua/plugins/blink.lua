vim.pack.add({
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("^1"),
	},
})

-- 在首次插入模式下进行延迟加载
-- BlinkCmpLazyLoad 组名
-- { clear = true }（最关键的参数）：意思是“如果这个组已经存在，先清空里面所有的自动命令”。
-- 为什么要清空？ 因为当你修改了配置并重新加载（:source %）时，这段代码会再次运行。
-- 如果不设置 clear = true，旧的自动命令就会残留在后台，导致同一个事件触发两次甚至多次。
local group = vim.api.nvim_create_augroup("BlinkCmpLazyLoad", { clear = true })


-- InsertEnter 进入插入事件触发
vim.api.nvim_create_autocmd("InsertEnter", {
	pattern = "*", -- 匹配任意名字的缓冲区
	group = group,
	once = true, -- 第一次被触发并执行完动作（callback）后，自动将这个自动命令从内存中注销并彻底删除
	callback = function()
		require("blink.cmp").setup({
			keymap = { preset = "super-tab" }, -- 使用预设的 super-tab 快捷键方案。
			appearance = {
				nerd_font_variant = "mono",
				use_nvim_cmp_as_default = true,
			},
			completion = {
				documentation = { auto_show = false },
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		})
	end,
})
