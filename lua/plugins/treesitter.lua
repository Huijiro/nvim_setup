return {
  "windwp/nvim-ts-autotag",
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
      require('nvim-treesitter.configs').setup {
        highlight = {
          enable = true,
        },
        ensure_installed = { "lua", "vim", "typescript", "json" },
        sync_install = false,
        autotag = {
          enable = true
        }
      }
    end,
  }

}
