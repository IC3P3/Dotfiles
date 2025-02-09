-- Sets the default leader key for Neovim
-- This config uses <space> as default
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Downloads and initializes the lazy.nvim plugin manager
require("lazy-bootstrap")
require("lazy-plugins")
