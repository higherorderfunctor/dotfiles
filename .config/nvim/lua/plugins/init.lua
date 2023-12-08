return {
	{
		"catppuccin/nvim",
		lazy = false,
		priority = 1000,
		opts = {
			flavour = "mocha",
			transparent_background = true,
			highlight_overrides = {
				all = function(colors)
					return {
						NotifyBackground = { bg = colors.base },
						SpellBad = { fg = colors.crust, bg = colors.red },
					}
				end,
			},
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd([[colorscheme catppuccin]])
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin",
		},
	},
	{
		"folke/flash.nvim",
		opts = {
			modes = {
				char = {
					jump_labels = true,
				},
			},
		},
	},
}
