return {
	"nvim-mini/mini.ai",
	enabled = true,
	version = false,
	config = function()
		require("mini.ai").setup()
	end,
}
