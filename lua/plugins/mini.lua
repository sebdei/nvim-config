return {
	-- sic! mini is a collection of tools and only sub modules are activated here
	{
		"nvim-mini/mini.ai",
		enabled = true,
		version = false,
	},
	{
		"nvim-mini/mini.notify",
		enabled = true,
		version = false,
	},
	{
		"nvim-mini/mini.icons",
		enabled = true,
		version = false,
		config = function()
			require("mini.icons").setup()

			MiniIcons.mock_nvim_web_devicons()
		end,
	},
}
