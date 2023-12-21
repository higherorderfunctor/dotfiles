local lint_progress = function()
	local linters = require("lint").get_running()
	require("notify")(vim.inspect("󱉶 " .. table.concat(linters, ", ")))
	for linter in pairs(linters) do
		require("notify")("󰦕" .. linter)
	end
end

return {
	"mfussenegger/nvim-lint",
	opts = {
		linters_by_ft = {
			bash = { "shellcheck", "shellharden" },
			markdown = { "markdownlint" },
			lua = { "luacheck" },
			docker = { "hadolint" },
		},
	},
	keys = {
		{ "<leader>xz", lint_progress, desc = "Show Active Linters" },
	},
}
