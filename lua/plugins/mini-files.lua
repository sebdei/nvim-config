return {
	"nvim-mini/mini.files",
	version = "*",
	keys = {
		{ "\\", ":lua MiniFiles.open()<CR>", desc = "Minifiles open", silent = true },
	},
	config = function()
		require("mini.files").setup()
	end,
}
