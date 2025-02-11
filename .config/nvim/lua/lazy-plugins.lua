-- Configures lazy.nvim and installs given plugins
require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
})

-- vim: ts=2 sts=2 sw=2 et
