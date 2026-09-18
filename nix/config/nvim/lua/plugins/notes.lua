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
		end,
		config = function(_, opts)
			opts.latex = {
				enabled = true,
				converter = "latex2text", -- requires pylatexenc
				inline = true,
				block = true,
				highlight = "RenderMarkdownMath",
				bottom_pad = 0.5,
				top_pad = 0.5,
			}
			require("render-markdown").setup(opts)
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
		-- Upstream bug: file.cday / file.mday carry the time-of-day, so they
		-- never equal date literals (midnight). Floor them to day start.
		-- Remove this once fixed upstream.
		build = function()
			local f = vim.fn.stdpath("data") .. "/lazy/obsidian-query.nvim/lua/obsidian-query/dataview/page.lua"
			local text = table.concat(vim.fn.readfile(f), "\n")
			if text:find("local function day_start") then
				return
			end
			local helper = [[

local NULL = value.NULL

---Floor a raw epoch ts to local midnight so "date"-precision values compare
---equal to date literals (parse_date already floors to midnight).
local function day_start(ts)
	local t = os.date("*t", math.floor(ts))
	return os.time({ year = t.year, month = t.month, day = t.day, hour = 0, min = 0, sec = 0 })
end
]]
			text = text:gsub("local NULL = value.NULL", helper, 1)
			text = text:gsub(
				vim.pesc('mday = value.date(row.mtime or 0, "date"),'),
				'mday = value.date(day_start(row.mtime or 0), "date"),',
				1
			)
			text = text:gsub(
				vim.pesc('rawset(self, "cday", value.date(ts, "date"))'),
				'rawset(self, "cday", value.date(day_start(ts), "date"))',
				1
			)
			vim.fn.writefile(vim.split(text, "\n", { plain = true }), f)
		end,
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
