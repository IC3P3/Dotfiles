return {
	-- "Library of 40+ independent Lua modules improving overall Neovim"
	{
		"echasnovski/mini.nvim",
		tag = "v0.15.0",
		config = function()
			-- Better Around/Inside textobjects
			require("mini.ai").setup({ n_lines = 500 })

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			require("mini.surround").setup()

			-- Move any selection in any direction
			-- works in visual and normal mode with M-h, M-j, M-k or M-l
			require("mini.move").setup()
		end,
	},
}

-- vim: ts=2 sts=2 sw=2 et
