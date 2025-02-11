-- A set of constants to change some settings
require("config/constants")

-- Sets default options and settings specific to Neovim
require("config/options")
require("config/keymaps")
require("config/autocmd")

-- Downloads and initializes the lazy.nvim plugin manager
require("lazy-bootstrap")
require("lazy-plugins")

-- vim: ts=2 sts=2 sw=2 et
