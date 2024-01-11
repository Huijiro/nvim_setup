return {
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'zbirenbaum/copilot.lua',
  'onsails/lspkind.nvim',
  {
    'zbirenbaum/copilot-cmp',
    event = { "InsertEnter", "LspAttach" },
    fix_pairs = true,
  },
  'windwp/nvim-autopairs',
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require('cmp')

      require('copilot').setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
      require('copilot_cmp').setup()

      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true

      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local lspkind = require('lspkind')

      local luasnip = require('luasnip')
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'copilot' },
          { name = 'path' },
          { name = 'buffer' }
        }),
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<C-y>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
          }),
          ["<CR>"] = cmp.mapping({
            i = function(fallback)
              if cmp.visible() and cmp.get_active_entry() then
                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
              else
                fallback()
              end
            end,
            s = cmp.mapping.confirm({ select = true }),
            c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
          }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              if #cmp.get_entries() == 1 then
                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
              else
                cmp.select_next_item()
              end
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        view = {
          entries = {
            name = "custom",
            selection_order = "near_cursor"
          }
        },
        formatting = {
          format = lspkind.cmp_format()
        }
      })

      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      require('nvim-autopairs').setup()

      local cmp_autopairs_completion = require('nvim-autopairs.completion.cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs_completion.on_confirm_done()
      )
    end
  }
}
