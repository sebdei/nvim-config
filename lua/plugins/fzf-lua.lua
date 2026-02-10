return {
	"ibhagwan/fzf-lua",

	-- optional for icon support
	-- dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	dependencies = { "nvim-mini/mini.icons" },

	---@module "fzf-lua"
	---@type fzf-lua.Config|{}
	---@diagnostic disable: missing-fields
	opts = {},
	---@diagnostic enable: missing-fields
	keys = {
		{ "<leader><leader>", ":FzfLua buffers<CR>", desc = "[F]ind in Buffers" },
		{ "<leader>f.", ":FzfLua resume<CR>", desc = "[F]ind resume[.]" },
		{ "<leader>f/", ":FzfLua grep_curbuf<CR>", desc = "[F]ind in current buffer" },
		{ "<leader>fW", ":FzfLua grep_cWORD<CR>", desc = "[F]ind [W]ORD" },
		{ "<leader>fc", ":FzfLua commands<CR>", desc = "[F]ind [C]ommands" },
		{ "<leader>fd", ":FzfLua diagnostics_document<CR>", desc = "[F]ind [D]iagnostics" },
		{ "<leader>ff", ":FzfLua files<CR>", desc = "[F]ind [F]iles" },
		{ "<leader>fg", ":FzfLua live_grep<CR>", desc = "[F]ind [G]rep" },
		{ "<leader>fh", ":FzfLua helptags<CR>", desc = "[F]ind [H]elp" },
		{ "<leader>fk", ":FzfLua keymaps<CR>", desc = "[F]ind [K]eymaps" },
		{ "<leader>fo", ":FzfLua oldfiles<CR>", desc = "[F]ind [O]ld Files" },
		{ "<leader>fq", ":FzfLua quickfix<CR>", desc = "[F]ind [Q]uickfix" },
		{ "<leader>fr", ":FzfLua registers<CR>", desc = "[F]ind [R]egisters" },
		{ "<leader>fw", ":FzfLua grep_cword<CR>", desc = "[F]ind [W]ord" },
		{ "<leader>fz", ":FzfLua<CR>", desc = "[F][z]f" },
		{
			"<leader>fn",
			function()
				require("fzf-lua").files({
					cwd = vim.fn.stdpath("config"),
					prompt = "Config> ",
				})
			end,
			desc = "[F]ind [N]eovim config",
		},
	},
	config = function()
		local fzf = require("fzf-lua")

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("fzf-lua-lsp-attach", { clear = true }),
			callback = function(event)
				local set_keymap = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = desc })
				end

				set_keymap("grr", fzf.lsp_references, "[G]oto [R]eferences")
				set_keymap("gri", fzf.lsp_implementations, "[G]oto [I]mplementation")
				set_keymap("grd", fzf.lsp_definitions, "[G]oto [D]efinition")
				set_keymap("grs", fzf.lsp_document_symbols, "Document [S]ymbols")
				set_keymap("grw", fzf.lsp_workspace_symbols, "[W]orkspace Symbols")
				set_keymap("grt", fzf.lsp_typedefs, "[G]oto [T]ype Definition")
			end,
		})
	end,
}
