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
					-- rosewater = "#f5e0dc",
					-- flamingo = "#f2cdcd",
					-- pink = "#f5c2e7",
					-- mauve = "#cba6f7",
					-- red = "#f38ba8",
					-- maroon = "#eba0ac",
					-- peach = "#fab387",
					-- yellow = "#f9e2af",
					-- green = "#a6e3a1",
					-- teal = "#94e2d5",
					-- sky = "#89dceb",
					-- sapphire = "#74c7ec",
					-- blue = "#89b4fa",
					-- lavender = "#b4befe",
					-- text = "#cdd6f4",
					-- subtext1 = "#bac2de",
					-- subtext0 = "#a6adc8",
					-- overlay2 = "#9399b2",
					-- overlay1 = "#7f849c",
					-- overlay0 = "#6c7086",
					-- surface2 = "#585b70",
					-- surface1 = "#45475a",
					-- surface0 = "#313244",
					-- base = "#1e1e2e",
					-- mantle = "#181825",
					-- crust = "#11111b",
					return {
						NeoTreeSymbolicLinkTarget = { fg = colors.peach },
						NotifyBackground = { bg = colors.base },
						SpellBad = { fg = colors.crust, bg = colors.red },
					}
				end,
			},
			integrations = {
				barbecue = {
					dim_dirname = true,
					bold_basename = true,
					dim_context = false,
					alt_background = false,
				},
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
