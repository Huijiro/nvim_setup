return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter"
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Find grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "Find buffers" },
    { "<leader>fG", "<cmd>Telescope git_status<cr>", desc = "Git status" },
    { "<leader>fc", "<cmd>Telescope git_commits<cr>", desc = "Git commits"}
  }
}
