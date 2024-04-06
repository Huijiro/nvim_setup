return {
  "kndndrj/nvim-dbee",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  build = function()
    require("dbee").install()
  end,
  config = function()
    require("dbee").setup()
  end,
  keys = {
      { '<leader>oo', function() require('dbee').open() end, desc = "Open DBee" },
  }
}
