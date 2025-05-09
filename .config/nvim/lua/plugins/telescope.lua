-- "telescope.nvim is a highly extendable fuzzy finder over lists."
return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		tag = "0.1.8",
		dependencies = {
			-- "It sets vim.ui.select to telescope. That means for example that
			-- neovim core stuff can fill the telescope picker. Example would
			-- be lua vim.lsp.buf.code_action()."
			{
				"nvim-telescope/telescope-ui-select.nvim",
				commit = "6e51d7da30bd139a6950adf2a47fda6df9fa06d2",
			},
			{
				"nvim-lua/plenary.nvim",
				commit = "857c5ac632080dba10aae49dba902ce3abf91b35",
			},
			-- "FZF sorter for telescope written in c."
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
				enabled = vim.g.HAVE_NERD_FONT,
			},
			-- "Jump into the repositories (git, mercurial…) of your filesystem with
			-- telescope.nvim, without any setup."
			{
				"cljoly/telescope-repo.nvim",
				commit = "a5395a4bf0fd742cc46b4e8c50e657062f548ba9",
			},
		},
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
					["repo"] = {
						list = {
							fd_opts = {
								"--no-ignore-vcs",
							},
							tail_path = true,
							search_dirs = {
								"~/Schreibtisch/Development",
								"~/.Dotfiles",
							},
						},
					},
				},
			})

			-- Enables the telescope plugins
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")
			pcall(require("telescope").load_extension, "repo")

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
					"node_modules",
					".svelte-kit",
				}, ",") .. "}",
			}

			-- Search through the vimdocs
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "{Telescope} [S]earch [H]elp" })

			-- Fuzzy find every file in the cwd
			vim.keymap.set("n", "<leader>sf", function()
				builtin.find_files({
					find_command = find_command,
				})
			end, { desc = "{Telescope} [S]earch [F]iles" })

			-- Live grep in the cwd
			vim.keymap.set("n", "<leader>se", builtin.live_grep, { desc = "{Telescope} [S]earch Gr[e]p" })

			-- Live grep but with the word under the cursor already given
			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "{Telescope} [S]earch current [W]ord" })

			-- Lists all diagnostics in telescope
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "{Telescope} [S]earch [Diagnostics]" })

			-- Search through command history
			vim.keymap.set(
				"n",
				"<leader>sc",
				builtin.command_history,
				{ desc = "{Telescope} [S]earch [C]ommand History" }
			)

			-- Search through currently open buffers
			vim.keymap.set("n", "<leader><leader>", function()
				builtin.buffers({
					sort_mru = true,
				})
			end, { desc = "[ ] Find existing buffers" })

			-- Lists all project (by found by VCS) in given paths
			vim.keymap.set(
				"n",
				"<leader>sp",
				require("telescope").extensions.repo.list,
				{ desc = "[S]earch [P]roject" }
			)

			-- List all git branches
			vim.keymap.set("n", "<leader>sgb", builtin.git_branches, { desc = "{Telescope} [S]earch [G]it [B]ranchs" })

			-- Search through most commits (doesn't show every commit in bigger repositories)
			vim.keymap.set("n", "<leader>sgc", builtin.git_commits, { desc = "{Telescope} [S]earch [G]it [C]ommits" })

			-- List everything listed in git status
			vim.keymap.set("n", "<leader>sgs", builtin.git_status, { desc = "{Telescope} [S]earch [G]it [S]tatus" })

			-- Lists the all stashes
			vim.keymap.set("n", "<leader>sgt", builtin.git_stash, { desc = "{Telescope} [S]earch [G]it S[t]ash" })
		end,
	},
}

-- vim: ts=2 sts=2 sw=2 et
