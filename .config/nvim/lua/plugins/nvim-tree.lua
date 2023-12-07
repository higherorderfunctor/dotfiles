
-- per https://github.com/nvim-tree/nvim-tree.lua#install
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin       = 1

return {
'nvim-tree/nvim-tree.lua',
lazy = false,
   opts = {
     hijack_cursor = true,
     sync_root_with_cwd = true,
  view = {
    width = {
      max = 30
    },
  },
  modified = { enable = true },
  ui = {
    confirm = {
      default_yes = true
    }
  },
  renderer = {
    highlight_opened_files = "icon",
     icons = {
       web_devicons = {
         folder = {
          color = true,
           enable = true
         },
         file = {
          color = true,
           enable = true
         }
       }
     },
        indent_markers = {
          enable = true,
              inline_arrows = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          },
        },
  },
  update_focused_file = { enable = true },
      filters = {
        git_ignored = false,
        dotfiles = false,
      custom = {
        "^.git$",
      },
    },
    actions = {
      change_dir = {
        enable = false,
        restrict_above_cwd = true,
      },
      }
   },
config = function(_, opts)
      require("nvim-tree").setup(opts)
 local wk = require("which-key")
 wk.register({ ["<C-o>"] = { function() require('nvim-tree.api').tree.toggle() end, "Toggle nvim-tree" }})

-- auto show hydra on nvimtree focus
local function change_root_to_global_cwd()
  local global_cwd = vim.fn.getcwd()
  -- local global_cwd = vim.fn.getcwd(-1, -1)
  api.tree.change_root(global_cwd)
end

local hint = [[
 _c_: Copy Path       _/_: Filter           _s_: System Open 
 _n_: New File        _d_: Delete File
 _y_: Copy File       _x_: Cut File         _p_: Paste File
 _r_: Rename File     _u_: Edit Path/Rename
 _h_: Toggle Hidden   _I_: Toggle Ignored   _?_: Help
]]
-- ^ ^           _q_: exit

local nvim_tree_hydra = nil

    local api = require("nvim-tree.api")
local nt_au_group = vim.api.nvim_create_augroup("NvimTreeHydraAu", { clear = true })

local Hydra = require "hydra"
local function spawn_nvim_tree_hydra()
  nvim_tree_hydra = Hydra {
          name = "NvimTree",
          hint = hint,
          config = {
              --color = "pink",
              invoke_on_body = true,
              buffer = 0, -- only for active buffer
              hint = {
                  position = "bottom",
                  border = "rounded",
              },
          },
          mode = "n",
          body = "H",
          heads = {
              { "c", api.fs.copy.absolute_path,     { silent = true } },
              { "/", api.live_filter.start,         { silent = true } },
              { "s", api.node.run.system,           { silent = true } },
              { "n", api.fs.create,                 { silent = true } },
              { "d", api.fs.remove,                 { silent = true } },
              { "y", api.fs.copy.node,              { silent = true } },
              { "x", api.fs.cut,                    { exit = true, silent = true } },
              { "p", api.fs.paste,                  { exit = true, silent = true } },
              { "r", api.fs.rename,                 { silent = true } },
              { "u", api.fs.rename_full,            { silent = true } },
              { "h", api.tree.toggle_hidden_filter, { silent = true } },
              { "I", api.tree.toggle_gitignore_filter, { silent = true } },
              { "?", api.tree.toggle_help,          { silent = true } },

              -- { "q", nil, { exit = true, nowait = true } },
          },
      }
  nvim_tree_hydra:activate()
end

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = "*",
    callback = function(opts)
      if vim.bo[opts.buf].filetype == "NvimTree" then
        spawn_nvim_tree_hydra()
      else
        if nvim_tree_hydra then
          nvim_tree_hydra:exit()
        end
      end
    end,
    group = nt_au_group,
})    

    end,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "anuvyklack/hydra.nvim",
  },
}
