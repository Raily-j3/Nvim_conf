return {
  'petertriho/nvim-scrollbar',
  config = function()
    require('scrollbar').setup {
      handlers = {
        diagnostic = false,
      },
    }
    require('scrollbar.handlers.gitsigns').setup()
  end,
}
