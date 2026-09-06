return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		local supported_languages = { "go", "java", "javascript", "lua", "vue", "yaml" }

		require("nvim-treesitter").setup()
		-- Install parsers + queries for the languages you use (no-op if installed)
		require("nvim-treesitter").install(supported_languages)

		-- Enable treesitter highlighting per filetype (features are not auto-enabled)
		vim.api.nvim_create_autocmd("FileType", {
			pattern = table.concat(supported_languages, ","),
			callback = function(args)
				vim.treesitter.start(args.buf)
			end,
		})
	end,
}
