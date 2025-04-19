return {
	-- "lazydev.nvim is a plugin that properly configures LuaLS for editing
	-- your Neovim config by lazily updating your workspace libraries."
	{
		"folke/lazydev.nvim",
		tag = "v1.9.0",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
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
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					-- A function that lets us more easily define mappings specific for LSP
					-- related items. It sets the mode, buffer and description for us each time.
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "{LSP} " .. desc })
					end

					local tbuiltin = require("telescope.builtin")

					-- Find the definition of the word under the cursor
					map("gd", tbuiltin.lsp_definitions, "[G]oto [D]efinition")

					-- Find the declaration of the word under the cursor
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

					-- Find references of the word under the cursor
					map("gr", tbuiltin.lsp_references, "[G]oto [R]eferences")

					-- Find implementation of the word under the cursor
					-- Useful if a language can declare a type without an actual implementation
					map("gi", tbuiltin.lsp_implementations, "[G]oto [I]mplementation")

					-- Rename variable under cursor
					map("<leader>cr", vim.lsp.buf.rename, "[C]ode [R]ename")

					-- Execute a code action on an error under the cursor
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })

					-- Displays the documentation about the word under the cursor
					map("K", vim.lsp.buf.signature_help, "Hover Documentation")

					-- Displays the documentation of the function the cursor is in
					vim.keymap.set(
						"i",
						"<C-k>",
						vim.lsp.buf.signature_help,
						{ buffer = event.buf, desc = "{LSP} " .. "Hover Signature Information" }
					)
				end,
			})
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			vim.diagnostic.config({
				severity_sort = true,
				float = { border = "rounded", source = "if_many" },
				underline = { severity = vim.diagnostic.severity.ERROR },
				signs = vim.g.HAVE_NERD_FONT and {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚 ",
						[vim.diagnostic.severity.WARN] = "󰀪 ",
						[vim.diagnostic.severity.INFO] = "󰋽 ",
						[vim.diagnostic.severity.HINT] = "󰌶 ",
					},
				} or {},
				virtual_text = {
					source = "if_many",
					spacing = 2,
					format = function(diagnostic)
						local diagnostic_message = {
							[vim.diagnostic.severity.ERROR] = diagnostic.message,
							[vim.diagnostic.severity.WARN] = diagnostic.message,
							[vim.diagnostic.severity.INFO] = diagnostic.message,
							[vim.diagnostic.severity.HINT] = diagnostic.message,
						}
						return diagnostic_message[diagnostic.severity]
					end,
				},
			})

			-- Load hyprland LSP in the right file
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
				pattern = { "*.hl", "hypr*.conf" },
				callback = function(event)
					print(string.format("starting hyprls for %s", vim.inspect(event)))
					vim.lsp.start({
						name = "hyprlang",
						cmd = { "hyprls" },
						root_dir = vim.fn.getcwd(),
					})
				end,
			})
		end,
	},
	-- "Display references, definitions and implementations of document symbols."
	{
		"Wansmer/symbol-usage.nvim",
		commit = "0f9b3da014b7e41559b643e7461fcabb2a7dc83a",
		event = "LspAttach",
		config = function()
			require("symbol-usage").setup({
				log = {
					enabled = false,
					level = "ERROR",
					stdout = {
						enabled = true,
					},
					log_file = {
						enabled = false,
						path = "",
					},
					notify = {
						enabld = true,
					},
				},
				filetypes = {},
			})
		end,
	},
}
