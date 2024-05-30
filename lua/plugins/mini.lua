return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    require('mini.pairs').setup()
    require('mini.ai').setup { n_lines = 500 }
    require('mini.surround').setup()
    require('mini.files').setup()
  end,
  keys = {
    { '<leader>e', function() require('mini.files').open() end },
  }
}
