-- "telescope.nvim is a highly extendable fuzzy finder over lists."
return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			-- Only enables web-devicons with NerdFonts
			{
				"nvim-tree/nvim-web-devicons",
				enabled = vim.g.have_nerd_font,
			},
		},
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			-- Enables the telescope plugins
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			-- Import default telescope functions
			local builtin = require("telescope.builtin")

			-- Refined search parameter to exclude given files and directories
			local find_command = {
				"rg",
				"--files",
				"--hidden",
				"-u",
				"-g",
				"!{" .. table.concat({
					".git",
					".keep",
					".git-keep",
					".gitkeep",
				}, ",") .. "}",
			}

			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "{Telescope} [S]earch [H]elp" })
			vim.keymap.set("n", "<leader>sf", function()
				builtin.find_files({
					find_command = find_command,
				})
			end, { desc = "{Telescope} [S]earch [F]iles" })
			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "{Telescope} [S]earch current [W]ord" })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "{Telescope} [S]earch [G]rep" })
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "{Telescope} [S]earch [Diagnostics]" })
			vim.keymap.set("n", "<leader>sr", builtin.oldfiles, { desc = "{Telescope} [S]earch [R]ecent Files" })
			vim.keymap.set(
				"n",
				"<leader>sc",
				builtin.command_history,
				{ desc = "{Telescope} [S]earch [C]ommand History" }
			)
		end,
	},
}

-- vim: ts=2 sts=2 sw=2 et
