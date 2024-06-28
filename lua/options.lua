local opt = vim.opt

opt.number = true -- Print line number
opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 4 -- Lines of context

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true -- Ignore case
opt.smartcase = true
-- Decrease update time
vim.opt.updatetime = 250
-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true
-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300
-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

opt.signcolumn = 'yes' -- Always show the signcolumn, otherwise it would shift the text each time
opt.showmode = false
opt.undofile = true

opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.clipboard = 'unnamedplus'

opt.fillchars = {
  foldopen = '',
  foldclose = '',
  fold = ' ',
  foldsep = ' ',
  diff = '╱',
  eob = ' ',
}
