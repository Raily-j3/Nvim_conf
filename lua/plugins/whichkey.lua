return {
  'folke/which-key.nvim',
  event = 'VeryLazy',

  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,

  opts = {
    plugins = { spelling = true },
    defaults = {
      mode = { 'n', 'v' },
      ['g'] = { name = '+goto' },
      ['gs'] = { name = '+surround' },
      ['z'] = { name = '+fold' },
      [']'] = { name = '+next' },
      ['['] = { name = '+prev' },
    },
  },
  config = function(_, opts)
    local wk = require 'which-key'
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
