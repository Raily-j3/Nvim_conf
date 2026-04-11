return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      'stevearc/conform.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      if pcall(require, 'cmp_nvim_lsp') then
        capabilities = require('cmp_nvim_lsp').default_capabilities()
      end
      -- [lua_ls]
      vim.lsp.config('lua_ls', {
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using
              -- (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = {
                'vim',
                'require',
              },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file('', true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
          },
        },
      })

      -- [C/C++ clangd]
      vim.lsp.config('clangd', {
        cmd = {
          'clangd',
          '--background-index',
          '--clang-tidy',
          '--header-insertion=never',
          '--offset-encoding=utf-16',
          '--fallback-style=llvm',
        },
        capabilities = capabilities,
        root_markers = { '.git', 'compile_commands.json', 'compile_flags.txt' },
      })

      vim.lsp.enable 'lua_ls'
      vim.lsp.enable 'clangd'
      vim.lsp.enable 'pyright'

      require('mason').setup()
      require('mason-tool-installer').setup {
        ensure_installed = {
          -- 'stylua',
          'lua_ls',
          'clangd',
          'clang-format',
        },
      }

      require('conform').setup {
        formatters_by_ft = {
          lua = { 'stylua' },
          -- c = { 'clang-format' },
          -- cpp = { 'clang-format' },
        },
        format_on_save = function(bufnr)
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end
          return { timeout_ms = 500, lsp_format = 'fallback' }
        end,
      }

      vim.api.nvim_create_user_command('FormatDisable', function(args)
        if args.bang then
          -- FormatDisable! will disable formatting just for this buffer
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, {
        desc = 'Disable autoformat-on-save',
        bang = true,
      })
      vim.api.nvim_create_user_command('FormatEnable', function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, {
        desc = 'Re-enable autoformat-on-save',
      })
      local format_enabled = true
      local function toggle_format()
        format_enabled = not format_enabled
        if format_enabled then
          vim.cmd 'FormatEnable'
          vim.notify('Formatting Enabled', vim.log.levels.INFO)
        else
          vim.cmd 'FormatDisable'
          vim.notify('Formatting Disabled', vim.log.levels.WARN) -- 警告色提醒关闭
        end
      end
      vim.keymap.set('n', '<leader>uf', toggle_format, { desc = 'Toggle Format' })
    end,
  },
}
