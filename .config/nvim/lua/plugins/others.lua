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
}

-- vim: ts=2 sts=2 sw=2 et
