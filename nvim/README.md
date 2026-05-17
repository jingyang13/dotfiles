# 依赖

```bash
# nvim-treesitter
sudo pacman -S tree-sitter-cli
```


# 其他
- LSP：知道你写的代码代表什么（变量类型、函数签名）
- Tree-sitter：知道你写的代码长什么样（哪些是函数、哪些是注释）


# 自动命令
- 事件（Events）：触发时机（什么时候执行？）。
- 模式（Pattern）：过滤条件（对哪些文件或缓冲区生效？）。
- 动作（Action）：执行内容（具体要做什么？

```Plaintext
当发生 [事件]      且文件满足 [模式]     则自动执行 [动作]
 (e.g., BufRead)      (e.g., *.md)       (e.g., setlocal wrap)
```


```lua
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.md",
    callback = function()
        vim.opt_local.wrap = true
    end,
})
```
- 事件：BufRead（读取文件到缓冲区）和 BufNewFile（创建新文件）。
- 模式：*.md（只对 Markdown 文件生效）。
- 动作：通过 callback 函数执行 Lua 代码，开启当前窗口的换行。

