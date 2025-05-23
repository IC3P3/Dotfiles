return {
	-- "An asynchronous linter plugin for Neovim complementary to the built-in
	-- Language Server Protocol support."
	{
		"mfussenegger/nvim-lint",
		commit = "6e9dd545a1af204c4022a8fcd99727ea41ffdcc8",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				markdown = { "markdownlint" },
				javascript = { "eslint" },
				typescript = { "eslint" },
			}
			-- Create autocommand which carries out the actual linting
			-- on the specified events.
			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					-- Only run the linter in buffers that you can modify in order to
					-- avoid superfluous noise, notably within the handy LSP pop-ups that
					-- describe the hovered symbol using Markdown.
					if vim.opt_local.modifiable:get() then
						lint.try_lint(nil, { ignore_errors = true })
					end
				end,
			})
		end,
	},
}
