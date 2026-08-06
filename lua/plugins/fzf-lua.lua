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

		{ "<leader>fC", ":FzfLua git_commits<CR>", desc = "[F]ind [C]ommits" },
		{ "<leader>fW", ":FzfLua grep_cWORD<CR>", desc = "[F]ind [W]ORD" },

		{ "<leader>fb", ":FzfLua git_bcommits<CR>", desc = "[F]ind [b]uffer commits" },
		{ "<leader>fc", ":FzfLua commands<CR>", desc = "[F]ind [c]ommands" },
		{ "<leader>fd", ":FzfLua diagnostics_document<CR>", desc = "[F]ind [d]iagnostics" },
		{ "<leader>ff", ":FzfLua files<CR>", desc = "[F]ind [F]iles" },
		{ "<leader>fg", ":FzfLua live_grep<CR>", desc = "[F]ind [g]rep" },
		{ "<leader>fh", ":FzfLua helptags<CR>", desc = "[F]ind [h]elp" },
		{ "<leader>fk", ":FzfLua keymaps<CR>", desc = "[F]ind [k]eymaps" },
		{ "<leader>fo", ":FzfLua oldfiles<CR>", desc = "[F]ind [o]ld Files" },
		{ "<leader>fq", ":FzfLua quickfix<CR>", desc = "[F]ind [q]uickfix" },
		{ "<leader>fr", ":FzfLua registers<CR>", desc = "[F]ind [r]egisters" },
		{ "<leader>fw", ":FzfLua grep_cword<CR>", desc = "[F]ind [w]ord" },
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
		{
			"<leader>ft",
			function()
				require("fzf-lua").files({ fzf_opts = { ["--query"] = vim.fn.expand("<cword>") } })
			end,
			desc = "[F]ind file and Go[T]o",
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
