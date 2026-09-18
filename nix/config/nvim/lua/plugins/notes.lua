return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = function(_, opts)
			opts.completions = { lsp = { enabled = true } }
			opts.custom_handlers = opts.custom_handlers or {}
			opts.custom_handlers.markdown = require("obsidian-query").handler
			opts.custom_handlers.markdown_inline = require("obsidian-query.inline").handler
			opts.latex = {
				enabled = true,
				converter = "latex2text", -- requires pylatexenc
				highlight = "RenderMarkdownMath",
			}
		end,
	},

	{
		"obsidian-nvim/obsidian.nvim",
		version = "*", -- use latest release, remove to use latest commit
		---@module 'obsidian'
		---@type obsidian.config
		opts = {
			legacy_commands = false,

			attachments = {
				img_text_func = function(path)
					local name = vim.fs.basename(tostring(path))
					local encoded_name = require("obsidian.util").urlencode(name)
					return string.format("![%s](%s)", name, encoded_name)
				end,
			},

			cache = {
				enabled = true,
			},

			workspaces = {
				{
					name = "catacomb",
					path = vim.fn.expand("~/Documents/Catacomb"),
				},
			},
			picker = {
				name = "telescope.nvim",
			},
		},
	},

	{
		"miller3616/bases.nvim",
		opts = {
			vault_path = vim.fn.expand("~/Documents/Catacomb"),
		},
	},

	{
		"dpezto/obsidian-query.nvim",
		ft = "markdown",
		opts = {
			picker = { style = "rich" }, -- show task text and query columns
		},
	},

	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		init = function()
			-- VimTeX configuration goes here, e.g.
			vim.g.vimtex_view_method = "zathura"
		end,
	},
}

