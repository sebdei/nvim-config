return {
	"nvim-mini/mini.notify",
	enabled = true,
	version = false,
	config = function()
		require("mini.notify").setup()
	end,
}
