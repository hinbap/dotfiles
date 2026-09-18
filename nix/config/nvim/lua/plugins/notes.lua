return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = function(_, opts)
			opts.custom_handlers = opts.custom_handlers or {}
			opts.custom_handlers.markdown = require("obsidian-query").handler
			opts.custom_handlers.markdown_inline = require("obsidian-query.inline").handler
		end,
		config = function()
			require("render-markdown").setup({
				completions = { lsp = { enabled = true } },
			})
		end,
	},

	{
		"obsidian-nvim/obsidian.nvim",
		version = "*", -- use latest release, remove to use latest commit
		---@module 'obsidian'
		---@type obsidian.config
		opts = {
			workspaces = {
				{
					name = "catacomb",
					path = "~/Documents/Catacomb",
				},
			},
			picker = {
				name = "telescope.nvim",
			},
		},

		config = function()
			require("obsidian").setup({
				attachments = {
					img_text_func = function(path)
						local name = vim.fs.basename(tostring(path))
						local encoded_name = require("obsidian.util").urlencode(name)
						return string.format("![%s](%s)", name, encoded_name)
					end,
				},
			})
		end,
	},

	{
		"miller3616/bases.nvim",
		config = function()
			require("bases").setup({
				vault_path = "~/Documents/Catacomb",
			})
		end,
	},

	{
		"dpezto/obsidian-query.nvim",
		ft = "markdown",
		opts = {
			picker = { style = "rich" }, -- show task text and query columns
		},
	},
}
