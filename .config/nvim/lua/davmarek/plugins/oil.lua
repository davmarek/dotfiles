local excluded_files = {
  ['..'] = true,
  ['.git'] = true,
  ['.DS_Store'] = true,
}

return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    columns = {
      'icon',
      'size',
    },
    skip_confirm_for_simple_edits = true,
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, _)
        return excluded_files[name] ~= nil
      end,
    },
  },
  -- Optional dependencies
  dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
