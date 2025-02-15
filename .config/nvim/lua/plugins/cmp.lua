-- "A completion engine plugin for neovim written in Lua. Completion
-- sources are installed from external repositories and "sourced"."
return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		tag = "v0.0.2",
		dependencies = {
			{
				"hrsh7th/cmp-nvim-lsp",
				commit = "99290b3ec1322070bcfb9e846450a46f6efa50f0",
			},
			{
				"hrsh7th/cmp-path",
				commit = "91ff86cd9c29299a64f968ebb45846c485725f23",
			},
			{
				"hrsh7th/cmp-nvim-lsp-signature-help",
				commit = "031e6ba70b0ad5eee49fd2120ff7a2e325b17fa7",
			},
		},
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				completion = { completeopt = "menu,menuone,noinsert" },

				mapping = cmp.mapping.preset.insert({
					-- Select the [n]ext item
					["<C-n>"] = cmp.mapping.select_next_item(),
					-- Select the [p]revious item
					["<C-p>"] = cmp.mapping.select_prev_item(),
					-- Confirm current item ([y]es)
					["<C-y>"] = cmp.mapping.confirm({ select = true }),

					-- Manually trigger the completion window
					["<C-Space>"] = cmp.mapping.complete({}),

					-- Scroll the documentation window [b]ack / [f]orward
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
				}),

				sources = {
					{ name = "nvim_lsp_signature_help" },
					{
						name = "lazydev",
						-- Effectively replaces LuaLS with lazydev
						group_index = 0,
					},
					{ name = "nvim_lsp" },
					{ name = "path" },
				},
			})
		end,
	},
}

-- vim: ts=2 sts=2 sw=2 et
