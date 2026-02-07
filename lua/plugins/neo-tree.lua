return {
	"nvim-neo-tree/neo-tree.nvim",
	enabled = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- optional, but recommended
	},
	lazy = false, -- neo-tree will lazily load itself
	keys = {
		{ "\\", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
	},
	opts = {
		filesystem = {
			follow_current_file = {
				enabled = true,
				leave_dirs_open = true,
			},
			window = {
				mappings = {
					["f"] = "noop",
					["<space>"] = "noop",
					["\\"] = "close_window",
				},
			},
		},
	},
}
