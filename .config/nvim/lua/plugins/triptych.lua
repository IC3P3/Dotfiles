return {
	-- "Directory browser for Neovim, inspired by Ranger"
	{
		"simonmclean/triptych.nvim",
		commit = "4ac0dfbfc2fd2b5d247cde16b323ed0e289c4f22",
		event = "VeryLazy",
		dependencies = {
			{
				"nvim-lua/plenary.nvim",
				commit = "857c5ac632080dba10aae49dba902ce3abf91b35",
			},
			-- Only enables the plugin when a NerdFont is use
			{
				"nvim-tree/nvim-web-devicons",
				commit = "1020869742ecb191f260818234517f4a1515cfe8",
				enabled = vim.g.HAVE_NERD_FONT,
			},
			{
				"antosha417/nvim-lsp-file-operations",
				commit = "9744b738183a5adca0f916527922078a965515ed",
			},
		},
		opts = {
			extension_mappings = {
				-- Fuzzy find inside of Triptych
				["<c-f>"] = {
					mode = "n",
					fn = function(target, _)
						require("telescope.builtin").live_grep({
							search_dirs = { target.path },
						})
					end,
				},
			},
		},
		keys = {
			-- Opens the Triptych file browser
			{ "<leader>-", ":Triptych<CR>" },
		},
		options = {
			line_numbers = {
				enable = false,
			},
		},
	},
}

-- vim: ts=2 sts=2 sw=2 et
