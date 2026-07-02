vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- enable 24-bit color
vim.opt.termguicolors = true

vim.o.number = true
vim.o.relativenumber = true
-- vim.o.showmode = false

vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Create an autocommand group for formatting on save
local format_on_save = vim.api.nvim_create_augroup("FormatOnSave", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
	group = format_on_save,
	pattern = "*",
	callback = function()
		-- 1. Save current cursor position and search register
		local save_cursor = vim.fn.getpos(".")
		local old_query = vim.fn.getreg("/")

		-- 2. Trim trailing whitespace (VS Code's trimTrailingWhitespace)
		vim.cmd([[%s/\s\+$//e]])

		-- 3. Trim extra newlines at the end of the file (VS Code's trimFinalNewlines)
		vim.cmd([[%s/\n\+\%$//e]])

		-- 4. Restore search register and cursor position
		vim.fn.setreg("/", old_query)
		vim.fn.setpos(".", save_cursor)
	end,
})
