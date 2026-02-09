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
		{ "<leader>fz", ":FzfLua<CR>", desc = "[F][z]f" },
		{ "<leader>fr", ":FzfLua registers<CR>", desc = "[F]ind [R]egisters" },
		{ "<leader>ff", ":FzfLua files<CR>", desc = "[F]ind files" },
		{ "<leader>fg", ":FzfLua live_grep<CR>", desc = "[F]ind by [G]rep" },
		{ "<leader>fb", ":FzfLua buffers<CR>", desc = "[F]ind in [B]uffers" },
		{ "<leader>fg", ":FzfLua live_grep<CR>", desc = "[F]ind by [G]rep" },
		{ "<leader>fg", ":FzfLua live_grep<CR>", desc = "[F]ind by [G]rep" },
		{ "<leader>fg", ":FzfLua live_grep<CR>", desc = "[F]ind by [G]rep" },
		{ "<leader>fg", ":FzfLua live_grep<CR>", desc = "[F]ind by [G]rep" },
	},
}
