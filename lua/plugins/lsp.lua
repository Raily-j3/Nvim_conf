return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'folke/neodev.nvim',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      { 'j-hui/fidget.nvim', opts = {} },

      -- Autoformatting
      'stevearc/conform.nvim',

      -- Schema information
      'b0o/SchemaStore.nvim',
    },
    config = function()
      require('neodev').setup {
        -- library = {
        --   plugins = { "nvim-dap-ui" },
        --   types = true,
        -- },
      }

      local capabilities = nil
      if pcall(require, 'cmp_nvim_lsp') then capabilities = require('cmp_nvim_lsp').default_capabilities() end

      local lspconfig = require 'lspconfig'

      local servers = {
        lua_ls = {
          server_capabilities = {
            semanticTokensProvider = vim.NIL,
          },
        },

        rust_analyzer = {
          settings = {
            ['rust-analyzer'] = {},
          },
        },

        pyright = {},
        -- jsonls = {
        --   settings = {
        --     json = {
        --       schemas = require('schemastore').json.schemas(),
        --       validate = { enable = true },
        --     },
        --   },
        -- },
        --
        -- yamlls = {
        --   settings = {
        --     yaml = {
        --       schemaStore = {
        --         enable = false,
        --         url = '',
        --       },
        --       schemas = require('schemastore').yaml.schemas(),
        --     },
        --   },
        -- },

        clangd = {
          root_dir = function(...)
            -- using a root .clang-format or .clang-tidy file messes up projects, so remove them
            return require('lspconfig.util').root_pattern(
              '.git',
              'compile_commands.json',
              'compile_flags.txt',
              'configure.ac'
            )(...)
          end,
          capabilities = {
            offsetEncoding = { 'utf-8' },
          },
          cmd = {
            'clangd',
            '--background-index',
            '--clang-tidy',
            '--header-insertion=never',
            '--completion-style=detailed',
            '--function-arg-placeholders',
            '--fallback-style=llvm',
          },
          init_options = {
            usePlaceholders = true,
            completeUnimported = true,
            clangdFileStatus = true,
          },
          filetypes = { 'c', 'cpp' },
        },
      }

      local servers_to_install = vim.tbl_filter(function(key)
        local t = servers[key]
        if type(t) == 'table' then
          return not t.manual_install
        else
          return t
        end
      end, vim.tbl_keys(servers))

      require('mason').setup()
      local ensure_installed = {
        'stylua',
        'lua_ls',
        'clangd',
        'clang-format',
      }

      vim.list_extend(ensure_installed, servers_to_install)
      require('mason-tool-installer').setup {
        ensure_installed = ensure_installed,
      }

      for name, config in pairs(servers) do
        if config == true then config = {} end
        config = vim.tbl_deep_extend('force', {}, {
          capabilities = capabilities,
        }, config)

        lspconfig[name].setup(config)
      end

      -- Autoformatting Setup

      require('conform').setup {
        formatters_by_ft = {
          lua = { 'stylua' },
        },
        format_on_save = function(bufnr)
          -- Disable with a global or buffer-local variable
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then return end
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

      -- vim.api.nvim_create_autocmd('BufWritePre', {
      --   callback = function(args)
      --     require('conform').format {
      --       bufnr = args.buf,
      --       lsp_fallback = true,
      --       quiet = true,
      --     }
      --   end,
      -- })
    end,
  },
}
