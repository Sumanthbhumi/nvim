local v = vim.opt

v.scrolloff = 10 -- Set scrolloff option
v.swapfile = false --Swapfile
-- set keyboard to unnamedplus
v.clipboard = "unnamedplus"
-- vim.api.nvim_set_hl(0, "Normal", { guibg = "NONE", ctermbg = "NONE" })
vim.keymap.set("i", "<c-bs>", "<C-W>", { noremap = true, silent = true })

v.cursorline = true -- Highlight the current line number in normal mode
v.cursorlineopt = "number"

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

v.conceallevel = 1
vim.api.nvim_create_autocmd("FileType", {
  pattern = "man",
  callback = function() v_local.number = true end,
})
-- Disable mouse in insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function() v.mouse = "" end,
})

-- Re-enable mouse when leaving insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function() v.mouse = "a" end,
})
-- Set cursor to block in all modes
-- v.guicursor = "n-v-c-sm:block,i-ci-ve:block,r-cr-o:block"
--
-- -- Define highlight groups
-- vim.cmd([[
--   highlight Cursor guifg=white guibg=#A6E3A2
--   highlight iCursor guifg=yellow guibg=cyan
--   highlight vCursor guibg=#A6E3A2 guifg=black
-- ]])
--
-- -- Apply iCursor highlight group to insert mode cursor
-- -- v.guicursor:append("i-ci-ve:block-iCursor")
-- v.guicursor = {
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
-- v.guicursor = {
-- 	"n-v-c-sm:block-Cursor-blinkwait300-blinkon200-blinkoff150",
-- 	"i-ci-ve:block-iCursor-blinkwait300-blinkon200-blinkoff150",
-- 	"r-cr-o:block-Cursor-blinkwait300-blinkon200-blinkoff150",
-- }
-- v.cmdheight = 0
--
vim.api.nvim_set_keymap(
  "t",
  "<C-j>",
  "<C-\\><C-n><CR>",
  { noremap = true, silent = true }
)
local augroup = vim.api.nvim_create_augroup("setIndent", { clear = true })

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
  command = "setlocal  colorcolumn=81",
})
