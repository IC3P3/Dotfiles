-- Sets the default leader key for Neovim
-- This config uses <space> as default
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Syncs the clipboard between the OS and Neovim
-- Lazy loads it at "UiEnter" to not impact the startup-time
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Enables break indent
vim.opt.breakindent = true

-- Save undo history to file
vim.opt.undofile = true

-- Makes searches case-insensitive unless \C or a capital letter is used
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- vim: ts=2 sts=2 sw=2 et
