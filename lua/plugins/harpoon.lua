return {
  'ThePrimeagen/harpoon',
  branch = "harpoon2",
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('harpoon').setup()
  end,
  keys = {
    { '<leader>hx', function() require('harpoon'):list():append() end,                                desc = "Add file to Harpoon" },
    { '<leader>hm', function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end, desc = "Open Harpoon Menu" },
    { '<C-[>',      function() require('harpoon'):list():prev() end },
    { '<C-]>',      function() require('harpoon'):list():next() end },
    { '<C-h>', function() require('harpoon'):list():select(1) end },
    { '<C-j>', function() require('harpoon'):list():select(2) end },
    { '<C-k>', function() require('harpoon'):list():select(3) end },
    { '<C-l>', function() require('harpoon'):list():select(4) end },
  }
}
