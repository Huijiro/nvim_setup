return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      require("mason-lspconfig").setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {
            capabilities = capabilities
          }
        end,
        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" }
                }
              }
            }
          }
        end,
      }

      vim.keymap.set('n', 'J', vim.diagnostic.open_float)

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          local builtin = require('telescope.builtin');

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', builtin.lsp_definitions, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', builtin.lsp_implementations, opts)
          vim.keymap.set('n', 'gtd', builtin.lsp_type_definitions, opts)
          vim.keymap.set('n', 'R', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, 'C', vim.lsp.buf.code_action, { desc = "Code Action", buffer = ev.buf })
          vim.keymap.set('n', 'gr', builtin.lsp_references, opts)
        end,
      })
    end
  } }
