-- local wk = require("which-key")
-- wk.register({
--   ["<leader>s"] = {
--     name = "source",
--     v = { "<cmd>source $MYVIMRC<CR>", "Reload init.lua" }
--     --nnoremap <leader>sv :source $MYVIMRC<CR>
--   }
-- })
return {
  -- Shows a list of your buffer local and global marks when you hit ` or '
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 200
  end,
  opts = {
    --triggers = {"<leader>"},
    window = {
border = "single",
    },
    defaults = {
  ["<F8>"] = {
    "<cmd>setlocal spell! spelllang=en_us<CR>",
  },
   ["<leader>s"] = {
     name = "+source",
     v = { "<cmd>source $MYVIMRC<CR>", "Reload init.lua" },
     --nnoremap <leader>sv :source $MYVIMRC<CR>
   }
    }
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
      config = function(_, opts)
        -- function keys don't seem to work rn, but keeping global mappings in same file
  vim.keymap.set("n", "<F8>", [[<cmd>setlocal spell! spelllang=en_us<CR>]], { silent = true })
      local wk = require("which-key")
      wk.setup(opts)
      wk.register(opts.defaults)
    end,
}

