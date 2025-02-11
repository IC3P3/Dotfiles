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

-- Sets how neovim displays certain whitespaces
vim.opt.list = true
vim.opt.listchars = {
	tab = "» ",
	trail = "·",
	nbsp = "␣",
}

-- Preview subsitionen live
vim.opt.inccommand = "split"

-- Highlights the line the cursor is in
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 12

-- Forces Neovim to use use en_US.UTF8
vim.cmd("silent! language en_US.UTF8")

-- Set behaviour of tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- vim: ts=2 sts=2 sw=2 et
