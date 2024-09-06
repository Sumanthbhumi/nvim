vim.opt.scrolloff = 5 -- Set scrolloff option
vim.opt.swapfile = false --Swapfile
-- set keyboard to unnamedplus
vim.opt.clipboard = "unnamedplus"
-- vim.api.nvim_set_hl(0, "Normal", { guibg = "NONE", ctermbg = "NONE" })
vim.keymap.set("i", "<c-bs>", "<C-W>", { noremap = true, silent = true })

vim.opt.cursorline = true -- Highlight the current line number in normal mode
vim.opt.cursorlineopt = "number"

-- vim.api.nvim_set_hl(0, "Comment", { fg = "#9a9684" })

-- vim.diagnostic.disable() --turn off diagnostic
-- vim.opt.signcolumn = "auto" --turn off sign column
vim.opt.conceallevel = 1
vim.keymap.set("n", "<CR>", '@="m`o<C-V><Esc>``"<CR>')
vim.keymap.set("n", "<S-CR>", '@="m`O<C-V><Esc>``"<CR>')
vim.api.nvim_create_autocmd("FileType", {
	pattern = "man",
	callback = function()
		vim.opt_local.number = true
	end,
})
-- vim.cmd([[colorscheme tokyonight]])
-- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#959DD4", bg = "NONE", bold = true })
local cmp_nvim_lsp = require("cmp_nvim_lsp")

require("lspconfig").clangd.setup({
	on_attach = on_attach,
	capabilities = cmp_nvim_lsp.default_capabilities(),
	cmd = {
		"clangd",
		"--offset-encoding=utf-16",
	},
})

-- Disable mouse in insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		vim.opt.mouse = ""
	end,
})

-- Re-enable mouse when leaving insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		vim.opt.mouse = "a"
	end,
})
-- Set cursor to block in all modes
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:block,r-cr-o:block"

-- Define highlight groups
vim.cmd([[
  highlight Cursor guifg=white guibg=green
  highlight iCursor guifg=yellow guibg=cyan
  highlight vCursor guibg=#A6E3A2 guifg=black
]])

-- Apply iCursor highlight group to insert mode cursor
vim.opt.guicursor:append("i-ci-ve:block-iCursor")
