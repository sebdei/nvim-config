return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,
	opts = {
		highlight_overrides = {
			all = function(colors)
				return {
					-- Default LineNr uses muted overlay1; brighten it for better contrast.
					LineNr = { fg = colors.subtext1 },
					CursorLineNr = { fg = colors.lavender, style = { "bold" } },
				}
			end,
		},
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		-- load the colorscheme here
		vim.cmd([[colorscheme catppuccin]])
	end,
}
