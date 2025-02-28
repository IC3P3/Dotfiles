-- "WhichKey helps you remember your Neovim keymaps, by showing
-- available keybindings in a popup as you type."
return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		tag = "v3.16.0",
		dependencies = {
			-- Only enables the plugin when a NerdFont is use
			{
				"nvim-tree/nvim-web-devicons",
				commit = "1020869742ecb191f260818234517f4a1515cfe8",
				enabled = vim.g.HAVE_NERD_FONT,
			},
		},
		opts = {
			-- Instant response on button press
			delay = 0,

			-- Floating window instead of part of bottom screen
			preset = "modern",

			icons = {
				-- Enables the use of the icon mapping
				mappings = vim.g.have_nerd_font,

				-- Sets the list to alternative text if no NerdFont is used
				keys = vim.g.HAVE_NERD_FONT and {} or {
					Up = "<Up> ",
					Down = "<Down> ",
					Left = "<Left> ",
					Right = "<Right> ",
					C = "<C-…> ",
					M = "<M-…> ",
					D = "<D-…> ",
					S = "<S-…> ",
					CR = "<CR> ",
					Esc = "<Esc> ",
					ScrollWheelDown = "<ScrollWheelDown> ",
					ScrollWheelUp = "<ScrollWheelUp> ",
					NL = "<NL> ",
					BS = "<BS> ",
					Space = "<Space> ",
					Tab = "<Tab> ",
					F1 = "<F1>",
					F2 = "<F2>",
					F3 = "<F3>",
					F4 = "<F4>",
					F5 = "<F5>",
					F6 = "<F6>",
					F7 = "<F7>",
					F8 = "<F8>",
					F9 = "<F9>",
					F10 = "<F10>",
					F11 = "<F11>",
					F12 = "<F12>",
				},
			},
			spec = {
				{ "<leader>s", "[S]earch" },
				{ "<leader>sg", "[S]earch [G]it" },
				{ "<leader>c", "[C]ode" },
				{ "<leader>p", "[P]ractice" },
			},
		},
	},
}

-- vim: ts=2 sts=2 sw=2 et
