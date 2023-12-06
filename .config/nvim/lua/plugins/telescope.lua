return {
    'nvim-telescope/telescope.nvim',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' },
   --       keys = {
   --     	  ["<leader>f"] = { name = "+file" },
   --   { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
   --   { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep Files" },
   --   { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "List Buffers" },
   --   { "<leader>fn", "<cmd>enew<cr>", desc = "New File" },
   -- },
	config = function(_, opts)
	local wk = require("which-key")
	wk.register({ ["<leader>f"] = {
		name = "Telescope",
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      g = { "<cmd>Telescope live_grep<cr>", "Grep Files" },
      b = { "<cmd>Telescope buffers<cr>", "List Buffers" },
      },
    })
      require("telescope").setup(opts)
    end,
--        keys = {
--                { ["<leader>"] = {
--      f = {
--        name = "+file",
--        f = { "<cmd>Telescope find_files<cr>", "Find File" },
--        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
--        n = { "<cmd>enew<cr>", "New File" },
--      },
--    }},
    }
