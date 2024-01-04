return {
  'folke/noice.nvim',
  event = "VeryLazy",
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    {
      "rcarriga/nvim-notify",
      opts = {
        background_colour = "#000000",
        top_down = false,
      },
    }
  },
  config = function()
    require('noice').setup({
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      }
    })
    require("telescope").load_extension("noice")
  end,
  keys = {
    { '<leader>fn', '<cmd>:Telescope notify<cr>', desc = "Notifications" },
    { '<leader>n',  '<cmd>:Noice dismiss<cr>',    desc = "Dismiss Noitifications" }
  }
}
