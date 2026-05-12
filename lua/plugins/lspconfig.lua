-- luacheck: globals vim
return {

	"neovim/nvim-lspconfig",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },

		-- Useful status updates for LSP.
		{ "j-hui/fidget.nvim", opts = {} },

		-- Allows extra capabilities provided by blink.cmp
		"saghen/blink.cmp",
	},
	opts = {
		language_servers = { "lua_ls", "gopls", "jdtls", "ts_ls", "vue_ls" },
	},
	config = function(_, opts)
		-- Get blink.cmp capabilities for each language
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		-- enable language servers
		for _, value in pairs(opts.language_servers) do
			vim.lsp.config(value, { capabilities = capabilities })
			vim.lsp.enable(value)
		end

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local set_keymap = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = desc })
				end

				set_keymap("gra", vim.lsp.buf.code_action, "[A]ction")
				set_keymap("grv", vim.lsp.buf.declaration, "[G]oto [V]ariable")
				set_keymap("grh", vim.lsp.buf.hover, "[H]over")
				set_keymap("gru", vim.lsp.buf.signature_help, "Signat[u]re Help")
				set_keymap("grn", vim.lsp.buf.rename, "Re[n]ame")

				-- sic! The following keymaps are defined in fzf-lua
				-- set_keymap("grd", vim.lsp.buf.definition, "[G]oto [D]efinition")
				-- set_keymap("gri", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
				-- set_keymap("grr", vim.lsp.buf.references, "References")
				-- set_keymap("grs", vim.lsp.buf.document_symbol, "Document [S]ymbols")
				-- set_keymap("grt", vim.lsp.buf.type_definition, "[T]ype Definition")
				-- set_keymap("grw", vim.lsp.buf.workspace_symbol, "[W]orkspace Symbols")

				-- The following two autocommands are used to highlight references of the
				-- word under your cursor when your cursor rests there for a little while.
				--    See `:help CursorHold` for information about when this is executed
				--
				-- When you move your cursor, the highlights will be cleared (the second autocommand).
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client:supports_method("textDocument/documentHighlight", event.buf) then
					local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})

					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
						end,
					})
				end

				-- The following code creates a keymap to toggle inlay hints in your
				-- code, if the language server you are using supports them
				--
				-- This may be unwanted, since they displace some of your code
				if client and client:supports_method("textDocument/inlayHint", event.buf) then
					set_keymap("<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
					end, "[T]oggle Inlay [H]ints")
				end
			end,
		})
	end,
}
