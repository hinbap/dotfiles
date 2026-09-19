return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			picker = {
				win = {
					input = {
						keys = {
							["<c-k>"] = { "select_and_prev", mode = { "n", "x" } },
							["<c-j>"] = { "select_and_next", mode = { "n", "x" } },
							["<c-d>"] = { "list_down", mode = { "i", "n" } },
							["<c-u>"] = { "list_up", mode = { "i", "n" } },
						},
					},
				},
			},

			img = {},

			image = {
				resolve = function(path, src)
					local api = require("obsidian.api")
					if api.path_is_note(path) then
						return api.resolve_attachment_path(src)
					end
				end,
			},
		},

		keys = {
			-- Top Pickers & Explorer
			{
				"<leader><space>",
				function()
					Snacks.picker.smart()
				end,
				desc = "Smart Find Files",
			},
			{
				"<leader>,",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Buffers",
			},
			{
				"<leader>/",
				function()
					Snacks.picker.grep()
				end,
				desc = "Grep",
			},
			{
				"<leader>:",
				function()
					Snacks.picker.command_history()
				end,
				desc = "Command History",
			},
			{
				"<leader>n",
				function()
					Snacks.picker.notifications()
				end,
				desc = "Notification History",
			},
		},
	},
}
