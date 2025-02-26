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
	-- Discord rich precense integration
	{
		"vyfor/cord.nvim",
		tag = "v2.1.0",
		build = "./build",
		event = "VeryLazy",
		opts = {
			timer = {
				interval = 2000,
			},
			editor = {
				tooltip = "Powered by Neovide and Kickstart",
			},
			display = {
				show_cursor_position = true,
			},
			lsp = {
				show_problem_count = true,
				severity = 2,
			},
			idle = {
				disable_on_focus = true,
			},
		},
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
	-- "Snapshot plugin with rich features that can make pretty
	-- code snapshots for Neovim"
	{
		"mistricky/codesnap.nvim",
		tag = "v1.6.1",
		build = "make",
		event = "VeryLazy",
		keys = {
			{ "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "[C]odeSnap to [C]lipboard" },
			{ "<leader>cf", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "[C]odeSnap Save to [F]ile" },
		},
		config = function()
			require("codesnap").setup({
				save_path = vim.g.CODESNAP_SAVE_PATH,
				has_breadcrumbs = false,
				show_workspace = false,
				has_line_number = true,
				bg_theme = "dusk",
				bg_y_padding = 50,
				bg_x_padding = 75,
				watermark = "",
				code_font_family = "Lilex Nerd Font",
			})
		end,
	},
}

-- vim: ts=2 sts=2 sw=2 et
