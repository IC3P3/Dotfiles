-- Activate or Deactivate the use of NerdFonts
vim.g.HAVE_NERD_FONTS = true

-- Sets the directories where telescope-repo should search
vim.g.REPO_SEARCH_DIRS = {
	"~/Schreibtisch/Development",
	"~/.dotfiles",
}

-- Sets where the images of codesnap should be saved
vim.g.CODESNAP_SAVE_PATH = os.getenv("HOME") .. "/Bilder/CodeSnap"
