vim.opt.scrolloff = 10 -- Set scrolloff option
vim.opt.swapfile = false --Swapfile
-- set keyboard to unnamedplus
vim.opt.clipboard = "unnamedplus"
-- vim.api.nvim_set_hl(0, "Normal", { guibg = "NONE", ctermbg = "NONE" })
vim.keymap.set("i", "<c-bs>", "<C-W>", { noremap = true, silent = true })

vim.opt.cursorline = true -- Highlight the current line number in normal mode
vim.opt.cursorlineopt = "number"

-- vim.api.nvim_set_hl(0, "Comment", { fg = "#636DA6" })

vim.api.nvim_set_hl(
  0,
  "Comment",
  { fg = "#959DD4", bg = "NONE", italic = true }
)
vim.api.nvim_set_hl(
  0,
  "CursorLineNr",
  { fg = "#959DD4", bg = "NONE", bold = true }
)
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#636DA6" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#636DA6" })

-- vim.diagnostic.disable() --turn off diagnostic
-- vim.opt.signcolumn = "auto" --turn off sign column
vim.opt.conceallevel = 1
vim.api.nvim_create_autocmd("FileType", {
  pattern = "man",
  callback = function() vim.opt_local.number = true end,
})
-- vim.cmd([[colorscheme tokyonight]])
-- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#959DD4", bg = "NONE", bold = true })

-- for 4 spaces and ignore errors
-- local cmp_nvim_lsp = require("cmp_nvim_lsp")
-- require("lspconfig").clangd.setup({
-- 	on_attach = on_attach,
-- 	capabilities = cmp_nvim_lsp.default_capabilities(),
-- 	cmd = {
-- 		"clangd",
-- 		"--offset-encoding=utf-16",
-- 	},
-- })

-- Disable mouse in insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function() vim.opt.mouse = "" end,
})

-- Re-enable mouse when leaving insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function() vim.opt.mouse = "a" end,
})
-- Set cursor to block in all modes
-- vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:block,r-cr-o:block"
--
-- -- Define highlight groups
-- vim.cmd([[
--   highlight Cursor guifg=white guibg=#A6E3A2
--   highlight iCursor guifg=yellow guibg=cyan
--   highlight vCursor guibg=#A6E3A2 guifg=black
-- ]])
--
-- -- Apply iCursor highlight group to insert mode cursor
-- -- vim.opt.guicursor:append("i-ci-ve:block-iCursor")
-- vim.opt.guicursor = {
-- 	"n-v-c:block-Cursor-blinkwait300-blinkon200-blinkoff150",
-- 	"i-ci-ve:block-iCursor-blinkwait300-blinkon200-blinkoff150",
-- 	"r-cr-o:hor20-Cursor-blinkwait300-blinkon200-blinkoff150",
-- }
-- Define highlight groups
-- vim.cmd([[
--   " highlight Cursor guifg=white guibg=#A6E3A2
--   highlight iCursor guifg=yellow guibg=white
--   highlight vCursor guibg=#A6E3A2 guifg=black
-- ]])
--
-- -- Set cursor configuration for all modes with blinking
-- vim.opt.guicursor = {
-- 	"n-v-c-sm:block-Cursor-blinkwait300-blinkon200-blinkoff150",
-- 	"i-ci-ve:block-iCursor-blinkwait300-blinkon200-blinkoff150",
-- 	"r-cr-o:block-Cursor-blinkwait300-blinkon200-blinkoff150",
-- }
-- vim.opt.cmdheight = 0
--
-- vim.api.nvim_create_autocmd("CmdlineEnter", {
-- 	group = vim.api.nvim_create_augroup("cmdheight_1_on_cmdlineenter", { clear = true }),
-- 	desc = "Don't hide the status line when typing a command",
-- 	command = ":set cmdheight=1",
-- })
--
-- vim.api.nvim_create_autocmd("CmdlineLeave", {
-- 	group = vim.api.nvim_create_augroup("cmdheight_0_on_cmdlineleave", { clear = true }),
-- 	desc = "Hide cmdline when not typing a command",
-- 	command = ":set cmdheight=0",
-- })
--
-- vim.api.nvim_create_autocmd("BufWritePost", {
-- 	group = vim.api.nvim_create_augroup("hide_message_after_write", { clear = true }),
-- 	desc = "Get rid of message after writing a file",
-- 	pattern = { "*" },
-- 	command = "redrawstatus",
-- })
vim.api.nvim_set_keymap(
  "t",
  "<C-j>",
  "<C-\\><C-n><CR>",
  { noremap = true, silent = true }
)
local augroup = vim.api.nvim_create_augroup("setIndent", { clear = true })
-- vim.api.nvim_create_autocmd("Filetype", {
--     group = augroup,
--     pattern = {
--         "css",
--         "html",
--         "javascript",
--         "lua",
--         "markdown",
--         "md",
--         "typescript",
--         "scss",
--         "xml",
--         "xhtml",
--         "yaml",
--     },
--     command = "setlocal shiftwidth=2 tabstop=2",
-- })

vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#181826" })
vim.api.nvim_create_autocmd("Filetype", {
  group = augroup,
  pattern = {
    "java",
    "javascript",
    "typescript",
    "lua",
    "python",
    "c",
    "cpp",
    "rust",
    "go",
    "javascriptreact",
    "typescriptreact",
  },
  command = "setlocal shiftwidth=4 tabstop=4 colorcolumn=81",
})
