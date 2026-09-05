return {
	"nvim-mini/mini.files",
	version = "*",
	keys = {
		{
			"\\",
			function()
				local MiniFiles = require("mini.files")

				local path = vim.api.nvim_buf_get_name(0)
				local isValidPath = vim.fn.filereadable(path) == 1

				if isValidPath then
					MiniFiles.open(path)
				else
					MiniFiles.open()
				end
			end,
			desc = "Minifiles open at current buffer",
		},
	},
	config = function()
		require("mini.files").setup()
	end,
}
