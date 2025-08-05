return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    local harpoon = require 'harpoon'
    local extensions = require 'harpoon.extensions'

    harpoon:setup()
    harpoon:extend(extensions.builtins.highlight_current_file())
    harpoon:extend(extensions.builtins.navigate_with_number())

    -- Adding a file to Harpoon list
    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = 'Harpoon [A]dd' })

    -- Show Harpoon list
    vim.keymap.set('n', '<leader>e', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Harpoon [E]xplorer' })

    -- File navigation for files 1-4
    vim.keymap.set('n', '<C-h>', function()
      harpoon:list():select(1)
    end, { desc = 'Harpoon [1]' })

    vim.keymap.set('n', '<C-j>', function()
      harpoon:list():select(2)
    end, { desc = 'Harpoon [2]' })

    vim.keymap.set('n', '<C-k>', function()
      harpoon:list():select(3)
    end, { desc = 'Harpoon [3]' })

    vim.keymap.set('n', '<C-l>', function()
      harpoon:list():select(4)
    end, { desc = 'Harpoon [4]' })
  end,
}
