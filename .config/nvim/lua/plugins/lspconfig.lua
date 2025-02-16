return {
	{
		"folke/lazydev.nvim",
		tag = "v1.9.0",
		ft = "lua",
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"Bilal2453/luvit-meta",
		commit = "1df30b60b1b4aecfebc785aa98943db6c6989716",
		lazy = true,
	},
	-- TODO: Remove mason later with automatic LSP installer
	{ "williamboman/mason.nvim", opts = {} },
	"williamboman/mason-lspconfig.nvim",
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	{
		"neovim/nvim-lspconfig",
		tag = "v1.6.0",
		dependencies = {
			{
				"j-hui/fidget.nvim",
				tag = "v1.6.1",
				opts = {},
			},
			{
				"hrsh7th/cmp-nvim-lsp",
				tag = "v0.0.2",
			},
		},
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				},
			}

			require("mason").setup()
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {})

			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {
							"stylua",
						})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
}
