return {
	"olimorris/codecompanion.nvim",
	enabled = true,
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {},
	keys = {
		{ "<leader>cp", ":CodeCompanion<CR>", mode = { "n", "v" }, desc = "[C]ode Companion [P]rompt" },
		{ "<leader>ca", ":CodeCompanionAction<CR>", mode = { "n", "v" }, desc = "[C]ode Companion [A]ction" },
		{ "<leader>cc", ":CodeCompanionChat<CR>", mode = { "n", "v" }, desc = "[C]ode Companion [C]hat" },
		{ "<leader>cm", ":CodeCompanionCmd<CR>", mode = { "n", "v" }, desc = "[C]ode Companion c[m]d" },
	},
}
