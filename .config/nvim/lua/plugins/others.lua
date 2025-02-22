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
}

-- vim: ts=2 sts=2 sw=2 et
