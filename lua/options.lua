vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.number = true -- Print line number
opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 4 -- Lines of context
opt.ignorecase = true -- Ignore case
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time

opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.clipboard = "unnamedplus"

opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
