return {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
  },
  config = function()
    require("mason-null-ls").setup({
      ensure_installed = { "prettier", "eslint_d", "eslint" },
    })

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    local null_ls = require("null-ls")
    require("null-ls").setup({
      sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.tsc,
        null_ls.builtins.code_actions.eslint_d,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                bufnr = bufnr,
                filter = function(filterclient)
                  return filterclient.name == "null-ls"
                end
              })
            end,
          })
        end
      end,
    })
  end,
  keys = {
    {
      "<leader>i",
      function()
        vim.lsp.buf.format({})
      end,
      desc = "Format buffer",
    }
  }
}
