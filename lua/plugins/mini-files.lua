return {
	"nvim-mini/mini.files",
	version = "*",
	config = function()
		require("mini.files").setup()
	end,
	keys = {
		{
			"\\",
			-- Toggle mini.files: reopen last location, or sync to current buffer
			function()
				local MiniFiles = require("mini.files")

				local state = MiniFiles.get_explorer_state()
				local buf = vim.api.nvim_buf_get_name(0)

				if state then
					local target = buf

					if vim.bo.filetype == "minifiles" then
						local tw = state.target_window

						if vim.api.nvim_win_is_valid(tw) then
							target = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(tw))
						end
					end

					local isValidFile = target ~= "" and vim.fn.filereadable(target) == 1

					if isValidFile then
						MiniFiles.open(target, false)
					else
						MiniFiles.open()
					end
				else
					local latest = MiniFiles.get_latest_path()

					local isFile = vim.fn.filereadable(buf) == 1
					local isDirectory = vim.fn.isdirectory(buf) == 1

					if latest then
						MiniFiles.open(latest)
					elseif isFile or isDirectory then
						MiniFiles.open(buf, false)
					else
						MiniFiles.open()
					end
				end
			end,
			desc = "Sync mini.files to current buffer, or reopen last location",
		},
	},
}
