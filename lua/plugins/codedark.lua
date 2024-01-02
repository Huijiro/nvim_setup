return {
  "Mofiqul/vscode.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.o.background = 'dark'

    require('vscode').setup({
      transparent = true,
    })
    require('vscode').load('dark')
  end
}
