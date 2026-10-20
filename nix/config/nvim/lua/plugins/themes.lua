return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				terminal_colors = true,
				transparent_mode = true,
				-- contrast = "hard",
				-- palette_overrides = { dark0_hard = "#0E1018" },
				overrides = {
					-- NormalFloat = { fg = "#ebdbb2", bg = "#504945" },
					-- Comment = { fg = "#81878f", italic = true, bold = true },
					-- Define = { link = "GruvboxPurple" },
					-- Macro = { link = "GruvboxPurple" },
					-- ["@constant.builtin"] = { link = "GruvboxPurple" },
					-- ["@storageclass.lifetime"] = { link = "GruvboxAqua" },
					-- ["@text.note"] = { link = "TODO" },
					-- ["@namespace.rust"] = { link = "Include" },
					-- ["@punctuation.bracket"] = { link = "GruvboxOrange" },
					-- texMathDelimZoneLI = { link = "GruvboxOrange" },
					-- texMathDelimZoneLD = { link = "GruvboxOrange" },
					-- luaParenError = { link = "luaParen" },
					-- luaError = { link = "NONE" },
					ContextVt = { fg = "#878788" },
					CopilotSuggestion = { fg = "#878787" },
					CocCodeLens = { fg = "#878787" },
					CocWarningFloat = { fg = "#dfaf87" },
					CocInlayHint = { fg = "#ABB0B6" },
					CocPumShortcut = { fg = "#fe8019" },
					CocPumDetail = { fg = "#fe8019" },
					DiagnosticVirtualTextWarn = { fg = "#dfaf87" },
					-- fold
					-- Folded = { fg = "#fe8019", bg = "#0E1018", italic = true },
					-- SignColumn = { bg = "#fe8019" },
					-- new git colors
					DiffAdd = {
						bold = true,
						reverse = false,
						fg = "",
						bg = "#2a4333",
					},
					DiffChange = {
						bold = true,
						reverse = false,
						fg = "",
						bg = "#333841",
					},
					DiffDelete = {
						bold = true,
						reverse = false,
						fg = "#442d30",
						bg = "#442d30",
					},
					DiffText = {
						bold = true,
						reverse = false,
						fg = "",
						bg = "#213352",
					},
					-- statusline
					-- StatusLine = { bg = "#ffffff", fg = "#0E1018" },
					-- StatusLineNC = { bg = "#3c3836", fg = "#0E1018" },
					-- CursorLineNr = { fg = "#fabd2f", bg = "" },
					-- GruvboxOrangeSign = { fg = "#dfaf87", bg = "#0E1018" },
					-- GruvboxAquaSign = { fg = "#8EC07C", bg = "#0E1018" },
					-- GruvboxGreenSign = { fg = "#b8bb26", bg = "#0E1018" },
					-- GruvboxRedSign = { fg = "#fb4934", bg = "#0E1018" },
					-- GruvboxBlueSign = { fg = "#83a598", bg = "#0E1018" },
					-- WilderMenu = { fg = "#ebdbb2", bg = "" },
					-- WilderAccent = { fg = "#f4468f", bg = "" },
					-- coc semantic token
					-- CocSemStruct = { link = "GruvboxYellow" },
					-- CocSemKeyword = { fg = "", bg = "#0E1018" },
					-- CocSemEnumMember = { fg = "", bg = "#0E1018" },
					-- CocSemTypeParameter = { fg = "", bg = "#0E1018" },
					-- CocSemComment = { fg = "", bg = "#0E1018" },
					-- CocSemMacro = { fg = "", bg = "#0E1018" },
					-- CocSemVariable = { fg = "", bg = "#0E1018" },
					-- CocSemFunction = { fg = "", bg = "#0E1018" },
					-- SnacksPicker = { fg = "#ebdbb2", bg = "" },
					-- SnacksPickerBorder = { fg = "#ebdbb2", bg = "" },
					-- SnacksPickerBoxBorder = { fg = "#ebdbb2", bg = "" },
					-- SnacksNormal = { fg = "#ebdbb2", bg = "" },
				},
			})

			vim.cmd.colorscheme("gruvbox")
		end,
	},

	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nordic").setup({
				bold_keywords = true,
				bright_border = true,
				reduced_blue = false,
				transparent = {
					bg = true,
					float = true,
				},
			})

			-- vim.cmd.colorscheme("nordic")
		end,
	},

	{
		"vague-theme/vague.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("vague").setup({
				transparent = true, -- If true, background is not set
				bold = true, -- Disable bold globally
				italic = true, -- Disable italic globally
				on_highlights = function(hl, colors) end,
				colors = {
					bg = "#000000",
					inactiveBg = "#000000",
					fg = "#cdcdcd",
					floatBorder = "#878787",
					line = "#252530",
					comment = "#606079",
					builtin = "#b4d4cf",
					func = "#c48282",
					string = "#e8b589",
					number = "#e0a363",
					property = "#c3c3d5",
					constant = "#aeaed1",
					parameter = "#bb9dbd",
					visual = "#333738",
					error = "#d8647e",
					warning = "#f3be7c",
					hint = "#7e98e8",
					operator = "#90a0b5",
					keyword = "#6e94b2",
					type = "#9bb4bc",
					search = "#405065",
					plus = "#7fa563",
					delta = "#f3be7c",
				},
			})

			-- vim.cmd.colorscheme("vague")
		end,
	},

	{
		-- Using lazy.nvim
		{
			"metalelf0/black-metal-theme-neovim",
			lazy = false,
			priority = 1000,
			config = function()
				require("black-metal").setup({
					-- optional configuration here, e.g.:

					theme = "burzum",
					transparent = true,
					trve = true, -- switch this to false if you want light variants
					code_style = {
						comments = "italic",
						conditionals = "none",
						functions = "none",
						keywords = "none",
						headings = "bold", -- Markdown headings
						operators = "none",
						keyword_return = "none",
						strings = "none",
						variables = "none",
					},
				})
				-- require("black-metal").load()
			end,
		},
	},

	{
		"wnkz/monoglow.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("monoglow").setup({
				transparent = true,
				on_highlights = function(hl, c)
					-- Override with full definition (recommended)
					hl["@function"] = { fg = c.syntax.func_def, italic = true, bold = true }
					hl.Boolean = { fg = c.syntax.boolean, bold = true, italic = true }
					hl["@keyword"] = { fg = c.syntax.keyword, italic = true }

					-- Or use vim.tbl_extend for partial overrides
					hl.Comment = vim.tbl_extend("force", hl.Comment, { bold = true })
				end,
			})

			vim.cmd.colorscheme("monoglow")
		end,
	},
}
