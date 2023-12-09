return {
	"nvim-neo-tree/neo-tree.nvim",
	opts = {
		default_component_configs = {
			symlink_target = { enabled = true },
		},
		filesystem = {
			window = {
				mappings = {
					["O"] = "system_open",
				},
			},
			commands = {
				system_open = function(state)
					local node = state.tree:get_node()
					local path = node:get_id()
					-- macOs: open file in default application in the background.
					vim.fn.jobstart({ "xdg-open", "-g", path }, { detach = true })
					-- Linux: open file in default application
					vim.fn.jobstart({ "xdg-open", path }, { detach = true })
				end,
			},
		},
	},
}
