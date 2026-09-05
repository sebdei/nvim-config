return {
	"nvim-mini/mini.icons",
	enabled = true,
	version = false,
	config = function()
		local miniIcons = require("mini.icons")

		miniIcons.setup()
		miniIcons.mock_nvim_web_devicons()
	end,
}
