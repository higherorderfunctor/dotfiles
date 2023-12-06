-- local wk = require("which-key")
-- wk.register({
-- 	["<leader>s"] = {
-- 		name = "source",
-- 		v = { "<cmd>source $MYVIMRC<CR>", "Reload init.lua" }
-- 		--nnoremap <leader>sv :source $MYVIMRC<CR>
-- 	}
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

 	["<leader>s"] = {
 		name = "+source",
 		v = { "<cmd>source $MYVIMRC<CR>", "Reload init.lua" },
 		--nnoremap <leader>sv :source $MYVIMRC<CR>
 	},{
	["<leader>"] = {
 		p = { "<cmd>bp<CR>", "Previous Buffer" },
 		n = { "<cmd>bn<CR>", "Next Buffer" },
 		d = { "<cmd>:bp | bd#<CR>", "Delete Buffer" },
 	}
      }
    }
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
      config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register(opts.defaults)
    end,
}

