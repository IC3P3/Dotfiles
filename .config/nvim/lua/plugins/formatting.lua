return {
	-- Automatically completes pairs like brackets or quotation marks
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		commit = "68f0e5c3dab23261a945272032ee6700af86227a",
		dependencies = {
			{
				"hrsh7th/nvim-cmp",
				tag = "v0.0.2",
			},
		},
		config = function()
			require("nvim-autopairs").setup({})

			-- If you want to automatically add `(` after selecting a function or method
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	-- Syncs tag pairs based on treesitter
	{
		"windwp/nvim-ts-autotag",
		commit = "a1d526af391f6aebb25a8795cbc05351ed3620b5",
		event = { "BufNewFile", "BufReadPre" },
		config = function()
			require("nvim-ts-autotag").setup({
				options = {
					enable_close_on_slash = true,
				},
			})
		end,
	},
	-- Detects tabstop and shiftwidth automatically
	-- or from EditorConfig or Modeline
	{
		"tpope/vim-sleuth",
		commit = "be69bff86754b1aa5adcbb527d7fcd1635a84080",
		event = "BufEnter",
	},
	-- "Indent guides for Neovim"
	{
		"lukas-reineke/indent-blankline.nvim",
		tag = "v3.8.7",
		main = "ibl",
		opts = {},
	},
	-- Formates the code in the current buffer
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		tag = "v9.0.0",
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				-- Disables formatting for specific filetypes
				-- Useful for languages that aren't well standardized
				local disable_filetypes = { c = true }
				local lsp_format_opt
				if disable_filetypes[vim.bo[bufnr].filetype] then
					lsp_format_opt = "never"
				else
					lsp_format_opt = "fallback"
				end
				return {
					timeout_ms = 500,
					lsp_format = lsp_format_opt,
				}
			end,
			-- A list of all used formatters
			formatters_by_ft = {
				lua = { "stylua" },
			},
		},
	},
}

-- vim: ts=2 sts=2 sw=2 et
