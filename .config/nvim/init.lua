-- Sets default options and settings specific to Neovim
require("config/options")
require("config/keymaps")

-- Downloads and initializes the lazy.nvim plugin manager
require("lazy-bootstrap")
require("lazy-plugins")
