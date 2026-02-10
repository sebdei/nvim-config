return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>a",
			function()
				require("harpoon"):list():add()
			end,
			desc = "Harpoon: Add File",
		},
		{
			"<C-e>",
			function()
				require("harpoon"):toggle_fzf(require("harpoon"):list())
			end,
			desc = "Harpoon: Open Menu",
		},
		{
			"<leader>1",
			function()
				require("harpoon"):list():select(1)
			end,
			desc = "Harpoon 1",
		},
		{
			"<leader>2",
			function()
				require("harpoon"):list():select(2)
			end,
			desc = "Harpoon 2",
		},
		{
			"<leader>3",
			function()
				require("harpoon"):list():select(3)
			end,
			desc = "Harpoon 3",
		},
		{
			"<leader>4",
			function()
				require("harpoon"):list():select(4)
			end,
			desc = "Harpoon 4",
		},
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		function harpoon:toggle_fzf(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("fzf-lua").fzf_exec(file_paths, {
				prompt = "Harpoon> ",
				actions = {
					["default"] = function(selected)
						if selected[1] then
							vim.cmd("edit " .. selected[1])
						end
					end,
				},
			})
		end
	end,
}
