-- Configures lazy.nvim and installs given plugins
require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	{
		ui = {
			-- Sets icons to default emojis if no NerdFont is used
			icons = vim.g.HAVE_NERD_FONT and {} or {
				cmd = "⌘",
				config = "🛠",
				event = "📅",
				ft = "📂",
				init = "⚙",
				keys = "🗝",
				plugin = "🔌",
				runtime = "💻",
				require = "🌙",
				source = "📄",
				start = "🚀",
				task = "📌",
				lazy = "💤 ",
			},
		},
	},
})

-- vim: ts=2 sts=2 sw=2 et
