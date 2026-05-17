vim.g.mapleader = " "
vim.g.maplocalleader = " "

if vim.loader then
    vim.loader.enable()
end

require("config")
require("plugins")

