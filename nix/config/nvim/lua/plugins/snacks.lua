return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			picker = {},

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

		config = function()
			require("snacks").setup({
				picker = {
					win = {
						input = {
							keys = {
								["<c-j>"] = { "list_down", mode = { "i", "n" } },
								["<c-k>"] = { "list_up", mode = { "i", "n" } },
								["<c-d>"] = { "list_down", mode = { "i", "n" } },
								["<c-u>"] = { "list_up", mode = { "i", "n" } },
							},
						},
					},
				},

				image = {
					formats = {
						"png",
						"jpg",
						"jpeg",
						"gif",
						"bmp",
						"webp",
						"tiff",
						"heic",
						"avif",
						"mp4",
						"mov",
						"avi",
						"mkv",
						"webm",
						"pdf",
						"icns",
					},
					force = false,
				},
			})
		end,

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
