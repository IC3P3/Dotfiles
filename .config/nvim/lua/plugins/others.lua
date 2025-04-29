return {
	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		tag = "v1.4.0",
		event = "VimEnter",
		dependencies = {
			{
				"nvim-lua/plenary.nvim",
				commit = "857c5ac632080dba10aae49dba902ce3abf91b35",
			},
		},
		opts = { signs = false },
		config = function()
			-- Search all TODO comments with Telescope
			vim.keymap.set("n", "<leader>st", ":TodoTelescope<CR>", { desc = "{TODO-Comment} [S]earch [T]odo" })
		end,
	},
	-- "Changes Vim working directory to project root."
	{
		"airblade/vim-rooter",
		commit = "51402fb77c4d6ae94994e37dc7ca13bec8f4afcc",
	},
	-- "Indent guides for Neovim"
	{
		"lukas-reineke/indent-blankline.nvim",
		tag = "v3.8.7",
		main = "ibl",
		opts = {},
	},
	-- "Rainbow delimiters for Neovim with Tree-sitter"
	{
		"HiPhish/rainbow-delimiters.nvim",
		tag = "v0.8.0",
	},
	-- "Run `nix develop` without restarting neovim"
	{
		"figsoda/nix-develop.nvim",
		commit = "afea026f5c478c000a8af8de87f7b711676387ab",
	},
}

-- vim: ts=2 sts=2 sw=2 et
