return {
  "mfussenegger/nvim-lint",
  event = { "InsertEnter", "LspAttach" },
  config = function()
    local lint = require("lint")


    lint.linters_by_ft = {
      typescript = { "eslint" },
      typescriptreact = { "eslint" },
      javascript = { "eslint" },
      javascriptreact = { "eslint" },
      json = { "eslint" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
      callback = function()
        local linters = require("lint").get_running()
        if #linters ~= 0 then
          lint.try_lint()
        end
      end,
    })
  end

}
