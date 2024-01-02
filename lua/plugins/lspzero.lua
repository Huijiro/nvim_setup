return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    config = function()
      local lsp_zero = require('lsp-zero')

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({ buffer = bufnr, preserve_mappings = false })
      end)
      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = { "lua_ls", "tsserver" },
        handlers = {
          lsp_zero.default_setup,
        },
      })

      require('copilot').setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
      require('copilot_cmp').setup()

      local cmp = require('cmp')
      local cmp_action = lsp_zero.cmp_action()

      cmp.setup({
        sources = {
          { name = 'copilot' },
          { name = 'nvim_lsp' },
        },
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp_action.tab_complete(),
          ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
        })
      })
    end,
    dependencies = {
      { 'neovim/nvim-lspconfig' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/nvim-cmp' },
      { 'L3MON4D3/LuaSnip' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { "zbirenbaum/copilot.lua" },
      { "zbirenbaum/copilot-cmp" },
    }
  },
}
