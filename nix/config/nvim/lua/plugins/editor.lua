return {
	{
		"jiaoshijie/undotree",
		opts = {
			-- your options
		},
	},

	{
		'ThePrimeagen/harpoon',
		dependencies = {
			'nvim-lua/plenary.nvim'
		},
		config = function()
			require("harpoon").setup()
			-- Use harpoon submodules directly instead of relying on a global `harpoon` variable
		end,
	},


	{
		"hedyhli/outline.nvim",
		lazy = true,
		cmd = { "Outline", "OutlineOpen" },
		keys = { -- Example mapping to toggle outline
			{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
		},
		opts = {
			position='left'
			-- Your setup opts here
		},
	},

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup()

		end,
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			fast_wrap = {
				chars = { "{", "[", "(", '"', "'", "`" },
				map = "<M-l>",
				keys = "asdfghjklqwertyuiop",
				pattern = [=[[%'%"%)%>%]%)%}%,]]=],
				check_comma = true,
				end_key = "L",
				highlight = "PmenuSel",
				hightlight_grey = "NonText",
			},
			check_ts = true,
			enable_check_bracket_line = true,
		},
		config = function(_, opts)
			local npairs = require("nvim-autopairs")
			local Rule = require("nvim-autopairs.rule")
			local cond = require("nvim-autopairs.conds")
			npairs.setup(opts)
			npairs.add_rules({
				-- inline math $...$ in markdown
				Rule("$", "$", { "markdown", "rmd", "quarto" })
					:with_move(cond.move_right())
:with_pair(function(p_opts)
					-- don't pair currency like "$5"
					return not p_opts.next_char:match("%d")
				end),
			})
		end,
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
	},

	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		keys = {
			{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
			{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
			{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
			{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
			{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
		},
	},

	{
		'nvim-mini/mini.cursorword',
		version = '*',
		config = function()
			require('mini.cursorword').setup()
		end
	},

	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
			"TmuxNavigatorProcessList",
		},
		keys = {
			{ "<c-h>", "<cmd><c-u>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><c-u>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><c-u>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><c-u>TmuxNavigateRight<cr>" },
			{ "<c-\\\\>", "<cmd><c-u>TmuxNavigatePrevious<cr>" },
		},
	},
}
