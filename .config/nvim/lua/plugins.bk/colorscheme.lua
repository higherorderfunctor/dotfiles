local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end
return  {
    "catppuccin/nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
     opts = { 
       flavour = "mocha",
       -- transparent_background = true,
       color_overrides = {
         mocha = {
    base = "#0c0c0c"
       }},
           highlight_overrides = {
        all = function(colors)
            return {
                -- WhichKeyFloat = { bg = colors.mantle  },
    NvimTreeNormal = { bg = "#070707" },
               -- WhichKeyBorder = { link = "#ff0000"},--colors.base  },
    -- WhichKeyBorder =  { asdf = "#ff0000" },
    SpellBad = { fg = colors.crust, bg = colors.red }
            }
        end,
},
           dim_inactive = {
        enabled = true, -- dims the background color of inactive window
  percentage = 0.75,
},
  integrations = { 
    --telescope = true,
    which_key = { enabled = true, border = true },
    nvimtree = true,
  }
    },
     config = function(_, opts)
       require("catppuccin").setup(opts)
--       vim.api.nvim_create_autocmd("ColorScheme", {
--   -- group = augroup("ChangeBackgroudColour"),
--   callback = function()
--     vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "#0a0a0a" })
--   end,
-- })

      -- autocmd ColorScheme * highlight WhichKeyFloat ctermbg=NONE ctermfg=NONE
--       vim.api.nvim_command([[
--     augroup ChangeBackgroudColour
--         autocmd colorscheme * :hi normal guibg=#0a0a0a
--     augroup END
-- ]])
      -- load the colorscheme here
      vim.cmd([[colorscheme catppuccin]])
    end,
  }
