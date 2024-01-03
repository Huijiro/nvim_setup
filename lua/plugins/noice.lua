return {
  'folke/noice.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    { "rcarriga/nvim-notify", config = { background_colour = "#000000", top_down = false } }
  },
  config = function()
    require('noice').setup({

    })
    require("telescope").load_extension("noice")
  end,
  keys = {
    { '<leader>fn', '<cmd>:Telescope notify<cr>', desc = "Notifications" }

  }
}
