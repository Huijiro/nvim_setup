return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300

    local wk = require("which-key")

    wk.register({
      f = "Find",
      F = { '<cmd>lua vim.lsp.buf.format({async = true})<cr>', 'Format' },
      t = "Terminal",
      h = "Harpoon",
      g = "Git",
      w = { ':w<cr>', 'Save' },
      q = { ':q<cr>', 'Quit' },
      Q = { ':q!<cr>', 'Force Quit' },
      b = {
        "Buffers",
        h = { ":bprev<cr>", "Previous Buffer" },
        l = { ":bnext<cr>", "Next Buffer" },
        c = { ":bdelete<cr>", "Close Buffer" },
      }
    }, { prefix = "<leader>" })

    wk.register({
      jj = { '<esc>', 'Escape', mode = 'i' },
      U = { '<c-r>', 'Redo' },
      H = { '^', 'Beginning of Line', mode = 'n' },
      L = { '$', 'End of Line', mode = 'n' },
      d = { '"_d', 'Delete', mode = 'n' },
      c = { '"_c', 'Change', mode = 'n' },
      r = { 'd', 'Replace', mode = 'n' },
    })
  end,
}
