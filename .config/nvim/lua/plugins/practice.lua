return {
	{
		"tris203/precognition.nvim",
		tag = "v1.1.0",
		event = "VeryLazy",
		config = function()
			require("precognition").setup({
				startVisible = false,
			})

			vim.keymap.set("n", "<leader>pp", function()
				require("precognition").toggle()
			end, { desc = "{Precognition} [P]ractice toggle [P]recognition" })
		end,
	},
}

-- vim: ts=2 sts=2 sw=2 et
