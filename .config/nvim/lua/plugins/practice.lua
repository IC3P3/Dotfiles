return {
	{
		"tris/precognition.nvim",
		tag = "v1.1.0",
		event = "VeryLazy",
		config = function()
			require("precognition").setup({
				startVisible = false,
			})

			vim.keymap.set(
				"n",
				"<leader>pp",
				require("precognition").toggle(),
				{ desc = "{Precognition} [P]ractice toggle [P]recognition" }
			)
		end,
	},
}
