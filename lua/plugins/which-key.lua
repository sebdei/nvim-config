return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		delay = 20,
		icons = { mappings = vim.g.have_nerd_font },
		preset = "modern",
		spec = {
			{ "<leader>f", group = "[F]ind", mode = { "n", "v" } },
			{ "<leader>c", group = "[C]ode", mode = { "n", "v" } },
			{ "<leader>s", group = "[S]hell", mode = { "n" } },
			{ "<leader>t", group = "[T]oggle" },
			{ "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
