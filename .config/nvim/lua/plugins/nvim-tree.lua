
-- per https://github.com/nvim-tree/nvim-tree.lua#install
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin       = 1

return {
'nvim-tree/nvim-tree.lua',
lazy = false,
config = function(_, opts)
      require("nvim-tree").setup(opts)
 local wk = require("which-key")
 wk.register({ ["<C-o>"] = { function() require('nvim-tree.api').tree.toggle() end, "Toggle nvim-tree" }})
    end,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}
