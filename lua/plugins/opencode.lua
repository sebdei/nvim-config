return {
	"nickjvandyke/opencode.nvim",
	enabled = true,
	event = "VeryLazy",
	config = function()
		---@type opencode.Opts
		vim.g.opencode_opts = {
			-- Your configuration, if any; goto definition on the type for details
		}

		local function scroll(buf)
			vim.keymap.set("n", "<S-Up>", function()
				require("opencode").command("session.half.page.up")
			end, { buffer = buf, desc = "Scroll OpenCode up" })
			vim.keymap.set("n", "<S-Down>", function()
				require("opencode").command("session.half.page.down")
			end, { buffer = buf, desc = "Scroll OpenCode down" })
		end

		vim.api.nvim_create_autocmd("TermOpen", {
			callback = function(event)
				if vim.api.nvim_buf_get_name(event.buf):match("opencode") then
					scroll(event.buf)
				end
			end,
		})
	end,
	keys = {
		{ "<leader>co", '<Cmd>lua require("opencode").ask("@this: ")<CR>', mode = { "n", "x" }, desc = "Ask OpenCode" },
		{ "<leader>cx", '<Cmd>lua require("opencode").select()<CR>', mode = { "n", "x" }, desc = "Select OpenCode" },
		{ "<leader>cs", '<Cmd>lua vim.env.OPENCODE_ENABLE_EXA = "1"; require("opencode").ask("Search the web for: ")<CR>', mode = { "n", "x" }, desc = "OpenCode web search" },
		{
			"<leader>cr",
			function()
				return require("opencode").operator("@this ")
			end,
			mode = "n",
			expr = true,
			desc = "Append range to OpenCode",
		},
		{
			"<leader>cl",
			function()
				return require("opencode").operator("@this ") .. "_"
			end,
			mode = "n",
			expr = true,
			desc = "Append line to OpenCode",
		},
	},
}
