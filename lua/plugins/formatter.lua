return {
  'mhartington/formatter.nvim',
  config = function()
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        vim.cmd [[FormatWrite]]
      end,

    })
    require('formatter').setup({
      logging = false,
      filetype = {
        javascript = {
          -- prettier
          function()
            return {
              exe = 'prettier',
              args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) },
              stdin = true,
            }
          end,
        },
        typescript = {
          -- prettier
          function()
            return {
              exe = 'prettier',
              args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) },
              stdin = true,
            }
          end,
        },
        javascriptreact = {
          -- prettier
          function()
            return {
              exe = 'prettier',
              args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) },
              stdin = true,
            }
          end,
        },
        typescriptreact = {
          -- prettier
          function()
            return {
              exe = 'prettier',
              args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) },
              stdin = true,
            }
          end,
        },
        json = {
          -- prettier
          function()
            return {
              exe = 'prettier',
              args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) },
              stdin = true,
            }
          end,
        },
        html = {
          -- prettier
          function()
            return {
              exe = 'prettier',
              args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) },
              stdin = true,
            }
          end,
        },
        css = {
          -- prettier
          function()
            return {
              exe = 'prettier',
              args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) },
              stdin = true,
            }
          end,
        },
        scss = {
          -- prettier
          function()
            return {
              exe = 'prettier',
              args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) },
              stdin = true,
            }
          end,
        },
      }
    })
  end
}
