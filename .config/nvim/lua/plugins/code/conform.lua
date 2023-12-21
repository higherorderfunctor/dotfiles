return {
	"stevearc/conform.nvim",
	opts = {
		format = { lsp_fallback = "always" },
		formatters_by_ft = {
			sh = { "shfmt", "beautysh" },
			["*"] = { "trim_newlines", "trim_whitespace" },
			["_"] = { "trim_newlines", "trim_whitespace" },
		},
	},
}
