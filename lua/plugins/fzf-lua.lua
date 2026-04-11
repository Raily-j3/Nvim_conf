-- File Picker
return {
  'ibhagwan/fzf-lua',
  lazy = false,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('fzf-lua').setup {
      defaults = {
        formatter = 'path.dirname_first', -- show greyed-out directory before filename
      },
      keymap = {
        fzf = {
          ['ctrl-u'] = 'half-page-up', -- in list of search results
          ['ctrl-d'] = 'half-page-down', -- in list of search results
          ['ctrl-c'] = 'abort',
        },
      },
    }
  end,
  keys = {
    -- Alt-h toggles hidden files in search results on/off
    { '<leader><leader>', '<cmd>FzfLua git_files<cr>', desc = 'find files in project directory' },
    { '<leader>r', '<cmd>FzfLua oldfiles<cr>', desc = '[f]ind [o]ld files' },
    {
      '<leader>fg',
      '<cmd>FzfLua grep<cr>',
      desc = 'fuzzy find by using ripgrep in project directory',
    },
    {
      '<leader>sw',
      '<cmd>FzfLua grep_visual<cr>',
      desc = '[f]ind (grep) [v]isual selection in project',
      mode = 'x',
    },
    { '<leader>n', '<cmd>FzfLua lsp_document_symbols<cr>' },
    -- { '<leader>n', '<cmd>FzfLua lsp_document_symbols<cr>' },

    { '<leader>fw', '<cmd>FzfLua grep_cword<cr>', desc = '[f]ind current [w]ord' },
    { '<leader>fW', '<cmd>FzfLua grep_cWORD<cr>', desc = '[f]ind current [W]ORD' },
    { '<leader>fr', '<cmd>FzfLua resume<cr>', desc = '[f]ind in [r]esumed search' },
    { '<leader>fb', '<cmd>FzfLua buffers<cr>', desc = '[f]ind open b[u]ffers' },
    { '<leader>fd', '<cmd>FzfLua diagnostics_document<cr>', desc = '[f]ind [d]iagnostics' },
    { '<leader>fa', '<cmd>FzfLua autocmds<cr>', desc = '[f]ind [a]utocommands' },
    { '<leader>fO', '<cmd>FzfLua nvim_options<cr>', desc = '[f]ind [o]ld files' },
    { '<leader>vh', '<cmd>FzfLua helptags<cr>', desc = '[v]iew/search Neovim [h]elp' },
    {
      '<leader>fig',
      function()
        require('fzf-lua').files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = 'find in neovim con[fig]uration',
    },
  },
}
