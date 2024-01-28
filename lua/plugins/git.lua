return {
  { 'f-person/git-blame.nvim' },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
    },
    config = function()
      require('gitsigns').setup()
    end
  },
  {
    'tpope/vim-fugitive',
    event = 'VeryLazy',
    keys = {
      {
        '<leader>gc',
        function()
          local command = nil;
          local commit_msg = vim.fn.input("Commit message: ")

          if commit_msg == nil or commit_msg == "" then
            command = "Git commit"
          else
            command = string.format("Git commit -m '%s'", commit_msg)
          end

          vim.cmd(command)
        end,
        desc = "Git commit"
      },
      { '<leader>gC', '<cmd>Git commit --amend<cr>', desc = "Git commit --amend" },
      { '<leader>ga', '<cmd>Git add .<cr>',          desc = "Git add all" },
      { '<leader>gs', '<cmd>Git<cr>',                desc = "Git status" },
      { '<leader>gp', '<cmd>Git pull<cr>',           desc = "Git pull" },
      { '<leader>gP', '<cmd>Git push -u origin<cr>', desc = "Git push" },
      { '<leader>gF', '<cmd>Git fetch<cr>',          desc = "Git fetch" },
      { '<leader>gL', '<cmd>Git log<cr>',            desc = "Git log" },
      { '<leader>gM', '<cmd>Git merge<cr>',          desc = "Git merge" },
    }
  }
}
