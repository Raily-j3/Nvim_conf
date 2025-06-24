local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.scrolloff = 4

opt.ignorecase = true
opt.smartcase = true
opt.updatetime = 250
opt.splitright = true
opt.splitbelow = true
opt.timeoutlen = 300

opt.signcolumn = 'yes'
opt.colorcolumn = '150'
opt.showmode = false
opt.undofile = true

opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.clipboard = 'unnamedplus'

vim.diagnostic.config {
  virtual_text = true,
  signs = false,
}
