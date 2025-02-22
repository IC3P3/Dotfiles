-- Higlights the area that got yanked
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Load Neovide settings when the UI is loaded
vim.api.nvim_create_autocmd("UIEnter", {
	group = vim.api.nvim_create_augroup("SetGUISettings", { clear = true }),
	callback = function()
		if vim.g.neovide then
			-- Use given Fonts if available
			vim.o.guifont = "Lilex Nerd Font,FiraCode Nerd Font,JetBrainsMono Nerd Font:h16"

			-- Makes animation time shorter
			vim.g.neovide_scroll_animation_length = 0.15
			vim.g.neovide_scroll_animation_far_lines = 0.5
			vim.g.neovide_cursor_animation_length = 0.07
			vim.g.neovide_cursor_trail_size = 0.3

			-- Other settings
			vim.g.neovide_hide_mouse_when_typing = true
			vim.g.neovide_refresh_rate = 120
			vim.g.neovide_detach_on_quit = "promt"
		end
	end,
	once = true,
})

-- Create the augroup for the number toggling
local numberToggleGroup = vim.api.nvim_create_augroup("NumberToggle", { clear = true })

-- Enable relative numbers when the buffer is focused
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
	group = numberToggleGroup,
	callback = function()
		if vim.wo.number and vim.api.nvim_get_mode().mode ~= "i" then
			vim.opt.relativenumber = true
		end
	end,
})

-- Disable relative numbers when the buffer is not focused
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
	group = numberToggleGroup,
	callback = function()
		if vim.wo.number then
			vim.opt.relativenumber = false
		end
	end,
})

-- vim: ts=2 sts=2 sw=2 et
