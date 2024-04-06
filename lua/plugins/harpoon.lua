return {
  'ThePrimeagen/harpoon',
  branch = "harpoon2",
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim'
  },
  keys = {
    { '<leader>hx', function() require('harpoon'):list():add() end,                                 desc = "Add file to Harpoon" },
    { '<leader>hm', function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end, desc = "Open Harpoon Menu" },
    {
      '<leader>fh',
      function()
        local conf = require('telescope.config').values
        local harpoon_files = require('harpoon'):list()
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require("telescope.pickers").new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        }):find()
      end,
      desc = "Open Harpoon Menu"
    },
    -- { '<C-[>', function() require('harpoon'):list():prev() end },
    -- { '<C-]>', function() require('harpoon'):list():next() end },
    { '<C-h>', function() require('harpoon'):list():select(1) end },
    { '<C-j>', function() require('harpoon'):list():select(2) end },
    { '<C-k>', function() require('harpoon'):list():select(3) end },
    { '<C-l>', function() require('harpoon'):list():select(4) end },
  }
}
