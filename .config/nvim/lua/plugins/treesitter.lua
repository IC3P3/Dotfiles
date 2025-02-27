return {
	-- "Nvim Treesitter configurations and abstraction layer"
	{
		"nvim-treesitter/nvim-treesitter",
		tag = "v0.9.3",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		opts = {
			ensure_installed = {
				"lua",
				"luadoc",
			},
			auto_install = true,
			highlight = {
				enable = true,
				-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
				--  If you are experiencing weird indenting issues, add the language to
				--  the list of additional_vim_regex_highlighting and disabled languages for indent.
				additional_vim_regex_highlighting = {},
			},
			indent = { enable = true, disable = {} },
		},
	},
	-- "Neovim plugin for splitting/joining blocks of code."
	{
		"Wansmer/treesj",
		commit = "48c1a7539f376fd40ceb9cf12d697040fcf90649",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		keys = {
			{
				"<leader>tb",
				function()
					require("treesj").toggle()
				end,
				mode = "n",
				desc = "{TreeSJ} [T]oggle Code [B]lock",
			},
		},
		config = function()
			require("treesj").setup({
				use_default_keymaps = false,
				cursor_behavior = "start",
			})
		end,
	},
}

-- vim: ts=2 sts=2 sw=2 et
