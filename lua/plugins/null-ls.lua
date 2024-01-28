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
    require("null-ls").setup({
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                bufnr = bufnr,
                filter = function(client)
                  return client.name == "null-ls"
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
