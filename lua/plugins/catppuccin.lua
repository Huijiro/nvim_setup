return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require('catppuccin').setup({
      transparent_background = true,
      integrations = {
        alpha = true,
        noice = true,
        notify = true,
        mason = true,
      }
    })
    vim.cmd [[colorscheme catppuccin]]
  end,
}
