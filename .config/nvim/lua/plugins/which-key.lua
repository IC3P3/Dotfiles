-- "WhichKey helps you remember your Neovim keymaps, by showing
-- available keybindings in a popup as you type."
return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- Instant response on button press
			delay = 0,

			-- Floating window instead of part of bottom screen
			preset = "modern",
		},
	},
}

-- vim: ts=2 sts=2 sw=2 et
