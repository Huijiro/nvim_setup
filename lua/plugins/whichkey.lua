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
      g = "Git"
    }, { prefix = "<leader>" })
  end,
  opts = {
  }
}
