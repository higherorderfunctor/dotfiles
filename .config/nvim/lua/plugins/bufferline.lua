return 
  -- This is what powers LazyVim's fancy-looking
  -- tabs, which include filetype icons and close buttons.
  {
    "akinsho/bufferline.nvim",
    after = "catppuccin",
    event = "VeryLazy",
    opts = {
      options = {
        color_icons = true,
  always_show_bufferline = true,
        -- stylua: ignore
        close_command = function(n) require("mini.bufremove").delete(n, false) end,
        -- stylua: ignore
        right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(_, _, diag)
          local icons = require("lazyvim.config").icons.diagnostics
          local ret = (diag.error and icons.Error .. diag.error .. " " or "")
            .. (diag.warning and icons.Warn .. diag.warning or "")
          return vim.trim(ret)
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
    config = function(_, opts)
      local mocha = require("catppuccin.palettes").get_palette "mocha"
      require("bufferline").setup(vim.tbl_deep_extend('force', opts, {

      highlights = require("catppuccin.groups.integrations.bufferline").get(),
      }))

      print(opts.keys)
   local wk = require("which-key")
   wk.register({
  ["<leader>"] = {
     b = { name = "+Bufferline", 
          P = { "<Cmd>BufferLineTogglePin<CR>", "Toggle Pin" },
          D = { "<Cmd>BufferLineGroupClose ungrouped<CR>", "Delete Non-Pinned" },
          d = { "<Cmd>BufferLineCloseOthers<CR>", "Delete Other Buffers" },
          r = { "<Cmd>BufferLineCloseRight<CR>", "Delete Buffers Right" },
          l = { "<Cmd>BufferLineCloseLeft<CR>", "Delete Buffers Left" },
          n = { "<Cmd>BufferLineMoveNext<CR>", "Move Buffer Right" },
          p = { "<Cmd>BufferLineMovePrev<CR>", "Move Buffer Left" },
    },
     p = { "<cmd>BufferLineCyclePrev<CR>", "Previous Buffer" },
     n = { "<cmd>BufferLineCycleNext<CR>", "Next Buffer" },
     d = { "<cmd>:bp | bd#<CR>", "Delete Buffer" },
   }
    })
    end,
    dependencies = {'nvim-tree/nvim-web-devicons', 'echasnovski/mini.nvim'}
  }
