return {
	-- Automatically comlpetes pairs like brackets or quotation marks
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	-- Formates the code in the current buffer
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		tag = "v8.4.0",
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
