return {
	"olimorris/codecompanion.nvim",
	enabled = true,
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		adapters = {
			acp = {
				codex = function()
					return require("codecompanion.adapters").extend("codex", {
						commands = {
							default = { "npx", "-y", "@agentclientprotocol/codex-acp" },
						},
						defaults = {
							auth_method = "chatgpt",
							model = "gpt-5.5",
						},
						env = {
							CODEX_CONFIG = '{"model":"gpt-5.5","web_search":"live"}',
							CODEX_PATH = "codex",
						},
					})
				end,
			},
		},
		interactions = {
			chat = {
				adapter = "codex",
			},
			cli = {
				agent = "codex",
				agents = {
					codex = {
						cmd = "codex",
						args = { "--search", "-m", "gpt-5.5" },
						description = "OpenAI Codex CLI with web search",
						provider = "terminal",
					},
				},
			},
		},
	},
	keys = {
		{ "<leader>cp", ":CodeCompanion<CR>", mode = { "n", "v" }, desc = "[C]ode Companion [P]rompt" },
		{ "<leader>ca", ":CodeCompanionAction<CR>", mode = { "n", "v" }, desc = "[C]ode Companion [A]ction" },
		{ "<leader>cc", ":CodeCompanionChat<CR>", mode = { "n", "v" }, desc = "[C]ode Companion [C]hat" },
		{ "<leader>cm", ":CodeCompanionCmd<CR>", mode = { "n", "v" }, desc = "[C]ode Companion c[m]d" },
		{ "<leader>ci", ":CodeCompanionCLI<CR>", mode = { "n", "v" }, desc = "[C]ode Companion CL[I]" },
	},
}
