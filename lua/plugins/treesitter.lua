return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local supported_languages = { "go", "javascript", "lua" }

		require("nvim-treesitter").install(supported_languages)

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "go" },
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}
