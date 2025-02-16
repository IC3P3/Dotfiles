return {
	-- "lazydev.nvim is a plugin that properly configures LuaLS for editing
	-- your Neovim config by lazily updating your workspace libraries."
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
	-- "Meta type definitions for the Lua platform Luvit."
	{
		"Bilal2453/luvit-meta",
		commit = "1df30b60b1b4aecfebc785aa98943db6c6989716",
		lazy = true,
	},
	-- "Portable package manager for Neovim that runs everywhere Neovim runs."
	-- TODO: Remove mason later with automatic LSP installer
	{ "williamboman/mason.nvim", opts = {} },
	"williamboman/mason-lspconfig.nvim",
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	-- "nvim-lspconfig is a "data only" repo, providing basic, default Nvim
	-- LSP client configurations for various LSP servers."
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
			vim.list_extend(ensure_installed, {
				"stylua",
			})

			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
}
