return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local supported_languages = { "go", "javascript", "lua", "vue" }

		require("nvim-treesitter").install(supported_languages)

		vim.api.nvim_create_autocmd("FileType", {
			pattern = supported_languages,
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}
