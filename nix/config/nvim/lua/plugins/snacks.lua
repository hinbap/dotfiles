return {
	{
		"folke/snacks.nvim",
		---@type snacks.Config
		opts = {
			picker = {
				win = {
					input = {
						keys = {
							["<C-k>"] = { "select_and_prev", mode = { "n", "x" } },
							["<C-j>"] = { "select_and_next", mode = { "n", "x" } },
						},
					},
				},
			},

			img = {},
		},
	},

	config = function()
		require("snacks").setup({
			image = {
				resolve = function(path, src)
					local api = require("obsidian.api")
					if api.path_is_note(path) then
						return api.resolve_attachment_path(src)
					end
				end,
			},
		})
	end,
}
