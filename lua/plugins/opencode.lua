return {
	"nickjvandyke/opencode.nvim",
	enabled = true,
	event = "VeryLazy",
	config = function()
		---@type opencode.Opts
		vim.g.opencode_opts = {
			-- Your configuration, if any; goto definition on the type for details
		}
	end,
	keys = {
		{ "<leader>co", '<Cmd>lua require("opencode").ask("@this: ")<CR>', mode = { "n", "x" }, desc = "Ask OpenCode" },
		{ "<leader>cx", '<Cmd>lua require("opencode").select()<CR>', mode = { "n", "x" }, desc = "Select OpenCode" },
		{
			"<leader>car",
			function()
				return require("opencode").operator("@this ")
			end,
			mode = "n",
			expr = true,
			desc = "Append range to OpenCode",
		},
		{
			"<leader>cal",
			function()
				return require("opencode").operator("@this ") .. "_"
			end,
			mode = "n",
			expr = true,
			desc = "Append line to OpenCode",
		},
		{
			"<S-Up>",
			'<Cmd>lua require("opencode").command("session.half.page.up")<CR>',
			mode = { "n" },
			desc = "Scroll OpenCode up",
		},
		{
			"<S-Down>",
			'<Cmd>lua require("opencode").command("session.half.page.down")<CR>',
			mode = { "n" },
			desc = "Scroll OpenCode down",
		},
	},
}
