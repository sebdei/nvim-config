return {
	"olimorris/codecompanion.nvim",
	enabled = true,
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		prompt_library = {
			["Chat with buffer"] = {
				interaction = "chat",
				description = "Start a chat with the current buffer",
				opts = {
					auto_submit = false,
				},
				prompts = {
					{
						role = "user",
						content = "#{buffer}\n\n",
					},
				},
			},
			["Chat with agent"] = {
				interaction = "chat",
				description = "Start a chat with an agent",
				opts = {
					auto_submit = false,
				},
				prompts = {
					{
						role = "user",
						content = "@{agent}\n\n",
					},
				},
			},
		},
		interactions = {
			chat = { adapter = "openai_responses" },
			inline = { adapter = "openai_responses" },
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
		adapters = {
			http = {
				openai_responses = function()
					return require("codecompanion.adapters").extend("openai_responses", {
						env = { api_key = "OPENAI_API_KEY" },
						schema = {
							model = {
								default = "gpt-5.5",
							},
						},
					})
				end,
			},
		},
	},
	keys = {
		{ "<leader>ci", ":CodeCompanion<CR>", mode = { "n", "v" }, desc = "[C]ode Companion [I]nline" },
		{ "<leader>ca", ":CodeCompanionActions<CR>", mode = { "n", "v" }, desc = "[C]ode Companion [A]ctions" },
		{ "<leader>cc", ":CodeCompanionChat<CR>", mode = { "n", "v" }, desc = "[C]ode Companion [C]hat" },
		{ "<leader>cm", ":CodeCompanionCmd<CR>", mode = { "n", "v" }, desc = "[C]ode Companion c[m]d" },
		{ "<leader>cl", ":CodeCompanionCLI<CR>", mode = { "n", "v" }, desc = "[C]ode Companion C[L]I" },
	},
}
