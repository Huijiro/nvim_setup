return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    init = function()
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    config = function()
      local lsp_zero = require('lsp-zero')

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
      { "zbirenbaum/copilot.lua" },
      { "zbirenbaum/copilot-cmp" },
      { 'L3MON4D3/LuaSnip' },
    }
  },
  {
    'neovim/nvim-lspconfig',
    cmd = 'LspInfo',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      {
        { 'williamboman/mason-lspconfig.nvim' },
        { 'hrsh7th/cmp-nvim-lsp' },
      },
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr, preserve_mappings = false })
      end)

      require('mason-lspconfig').setup({
        ensure_installed = { "lua_ls", "tsserver" },
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
        },
      })
    end
  },
}
