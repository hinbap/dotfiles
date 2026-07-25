return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				sql = { "sql_formatter" },
				svelte = { "prettier" },
				html = { "prettier" },
			},
		})
	end,
}
