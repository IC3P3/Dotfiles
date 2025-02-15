return {
	{
		"rose-pine/neovim",
		as = "rose-pine",
		lazy = false,
		varient = "moon",
		dim_inacitve_windows = true,
		enable = {
			legacy_highlights = false,
		},
		init = function()
			vim.cmd.colorscheme("rose-pine")
		end,
	},
}

-- vim: ts=2 sts=2 sw=2 et
