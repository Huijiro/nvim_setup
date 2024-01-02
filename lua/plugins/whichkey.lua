return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300

    local wk = require("which-key")

    wk.register({
      f = "Find",
      t = "Terminal",
      h = "Harpoon",
      c = {
        "Code",
        f = { '<cmd>lua vim.lsp.buf.format({async = true})<cr>', 'Format' }
      }
    }, { prefix = "<leader>" })
  end,
  opts = {
  }
}
