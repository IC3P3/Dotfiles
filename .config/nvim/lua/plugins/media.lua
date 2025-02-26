return {
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
}
