return {
  { 'f-person/git-blame.nvim' },
  {
    'tpope/vim-fugitive',
    keys = {
      { '<leader>gc', '<cmd>Git commit<cr>', desc = "Git commit" },
      { '<leader>gC', '<cmd>Git commit --amend<cr>', desc = "Git commit --amend" },
      { '<leader>ga', '<cmd>Git add .<cr>', desc = "Git add all" },
      { '<leader>gA', '<cmd>Git add %<cr>', desc = "Git add current file" },
      { '<leader>gs', '<cmd>Git<cr>', desc = "Git status" },
      { '<leader>gp', '<cmd>Git pull<cr>', desc = "Git pull" },
      { '<leader>gP', '<cmd>Git push -u origin<cr>', desc = "Git push" },
      { '<leader>gF', '<cmd>Git fetch<cr>', desc = "Git fetch" },
      { '<leader>gL', '<cmd>Git log<cr>', desc = "Git log" },
      { '<leader>gM', '<cmd>Git merge<cr>', desc = "Git merge" },
   }
  }
}
