return {
  'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    opts = {
    options = {
        theme = "catppuccin"
        -- ... the rest of your lualine config
    }
    },
  config = function(_, opts)
require('lualine').setup(opts)
  end,
  dependencies = { 'nvim-tree/nvim-web-devicons' }
}
