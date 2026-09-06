return {
	"nickjvandyke/opencode.nvim",
	enabled = true,
	event = "VeryLazy",
	keys = {
		{
			"<leader>cl",
			function()
				return require("opencode").operator("@this ") .. "_"
			end,
			mode = "n",
			expr = true,
			desc = "Append line to OpenCode",
		},
		{
			"<leader>cn",
			function()
				vim.cmd("vsplit term://opencode --port")
			end,
			desc = "OpenCode [n]ew terminal",
		},
		{
			"<leader>co",
			'<Cmd>lua require("opencode").ask("@this: ")<CR>',
			mode = { "n", "x" },
			desc = "Ask OpenCode",
		},
		{
			"<leader>cr",
			function()
				return require("opencode").operator("@this ")
			end,
			mode = { "n", "x" },
			expr = true,
			desc = "Append range to OpenCode",
		},
		{
			"<leader>cs",
			'<Cmd>lua vim.env.OPENCODE_ENABLE_EXA = "1"; require("opencode").ask("")<CR>',
			mode = { "n", "x" },
			desc = "OpenCode web [s]earch enabled",
		},
		{
			"<leader>cx",
			'<Cmd>lua require("opencode").select()<CR>',
			mode = { "n", "x" },
			desc = "Select OpenCode",
		},
		{
			"<S-Down>",
			function()
				require("opencode").command("session.half.page.down")
			end,
			desc = "Scroll OpenCode down",
		},
		{
			"<S-Up>",
			function()
				require("opencode").command("session.half.page.up")
			end,
			desc = "Scroll OpenCode up",
		},
	},
}
