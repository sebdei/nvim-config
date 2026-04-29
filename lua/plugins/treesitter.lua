return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local supported_languages = { "go", "java", "javascript", "lua", "vue" }

		require("nvim-treesitter").setup({
			ensure_installed = supported_languages,
			highlight = { enable = true },
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = table.concat(supported_languages, ","),
			callback = function(args)
				vim.treesitter.start(args.buf)
			end,
		})
	end,
}
