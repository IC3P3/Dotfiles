return {
	-- "Precognition uses virtual text and gutter signs to show available motions."
	{
		"tris203/precognition.nvim",
		tag = "v1.1.0",
		event = "VeryLazy",
		config = function()
			require("precognition").setup({
				startVisible = false,
			})

			-- Toggles the Precognition plugin
			vim.keymap.set("n", "<leader>pp", function()
				require("precognition").toggle()
			end, { desc = "{Precognition} [P]ractice toggle [P]recognition" })
		end,
	},
	-- "Establish good command workflow and quit bad habit."
	{
		"m4xshen/hardtime.nvim",
		commit = "48689c55f1204427206afc4ea1b9461a587d4558",
		dependencies = {
			{
				"MunifTanjim/nui.nvim",
				tag = "0.3.0",
			},
		},
		config = function()
			require("hardtime").setup({})

			-- Toggles if hardtime is active or not and tells you if it's turned on or off
			vim.keymap.set("n", "<leader>ph", function()
				if require("hardtime").toggle() then
					vim.notify("Enabled practice plugin Hardtime")
				else
					vim.notify("Disabled practice plugin Hardtime")
				end
			end, { desc = "{Hardtime} [P]ractice toggle [H]ardtime" })

			-- Gives you a report of the most common mistakes
			vim.keymap.set("n", "<leader>pr", "<cmd>Hardtime report<CR>", { desc = "{Hardtime} [P]ractice [R]eport" })
		end,
	},
}

-- vim: ts=2 sts=2 sw=2 et
