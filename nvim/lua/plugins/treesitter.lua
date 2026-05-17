vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main",
	},
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
		version = "main",
	},
})

-- =========================
-- Treesitter core
-- =========================
local ts = require("nvim-treesitter")

ts.setup({
	install_dir = vim.fn.stdpath("data") .. "/site",
})

ts.install({
	"bash",
	"c",
	"css",
	"go",
	"html",
	"javascript",
	"json",
	"lua",
	"markdown",
	"python",
	"rust",
	"tsx",
	"typescript",
	"vim",
	"yaml",
})

-- =========================
-- Treesitter enable (highlight/fold/indent)
-- =========================
vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local ft = vim.bo[args.buf].filetype

		local skip = {
			qf = true,
			help = true,
			man = true,
			lazy = true,
			TelescopePrompt = true,
			TelescopeResults = true,
			[""] = true,
		}

		if skip[ft] then
			return
		end

		pcall(vim.treesitter.start)

		vim.wo.foldmethod = "expr"
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})

-- =========================
-- textobjects: select
-- =========================
local sel = require("nvim-treesitter-textobjects.select")

for _, map in ipairs({
	{ { "x", "o" }, "af", "@function.outer" },
	{ { "x", "o" }, "if", "@function.inner" },
	{ { "x", "o" }, "ac", "@class.outer" },
	{ { "x", "o" }, "ic", "@class.inner" },
	{ { "x", "o" }, "aa", "@parameter.outer" },
	{ { "x", "o" }, "ia", "@parameter.inner" },
}) do
	vim.keymap.set(map[1], map[2], function()
		sel.select_textobject(map[3], "textobjects")
	end, { desc = "TS " .. map[3] })
end

-- =========================
-- textobjects: move
-- =========================
local mv = require("nvim-treesitter-textobjects.move")

local moves = {
	{ "]m", mv.goto_next_start, "@function.outer" },
	{ "[m", mv.goto_previous_start, "@function.outer" },
	{ "]]", mv.goto_next_start, "@class.outer" },
	{ "[[", mv.goto_previous_start, "@class.outer" },
	{ "]M", mv.goto_next_end, "@function.outer" },
	{ "[M", mv.goto_previous_end, "@function.outer" },
	{ "]o", mv.goto_next_start, { "@loop.inner", "@loop.outer" } },
	{ "[o", mv.goto_previous_start, { "@loop.inner", "@loop.outer" } },
}

for _, m in ipairs(moves) do
	vim.keymap.set({ "n", "x", "o" }, m[1], function()
		m[2](m[3], "textobjects")
	end, { desc = "TS move " .. m[1] })
end
