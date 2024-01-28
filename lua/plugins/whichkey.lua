return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300

    local wk = require("which-key")

    wk.register({
      f = "Find",
      i = { '<cmd>lua vim.lsp.buf.format({async = true})<cr>', 'Format' },
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
  end,
}
