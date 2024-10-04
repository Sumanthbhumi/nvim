-- Remap arrow keys in insert mode
vim.api.nvim_set_keymap("i", "<A-l>", "<Right>", { noremap = true })
vim.api.nvim_set_keymap("i", "<A-h>", "<Left>", { noremap = true })
vim.api.nvim_set_keymap("i", "<A-k>", "<Up>", { noremap = true })
vim.api.nvim_set_keymap("i", "<A-j>", "<Down>", { noremap = true })

-- vim.api.nvim_set_keymap("n", ";", ":", { noremap = true })
-- vim.api.nvim_set_keymap("n", ":", ";", { noremap = true })

vim.api.nvim_set_keymap("i", "<C-h>", "<C-w>", { noremap = true }) -- Delete the previous wordkey
vim.api.nvim_set_keymap("n", "<Tab>", ":bnext<CR>", { noremap = true }) -- Navigate to the next buffer
vim.api.nvim_set_keymap("n", "<S-Tab>", ":bprevious<CR>", { noremap = true }) -- Navigate to the previous buffer

-- Remap tmux-like navigation keys
-- vim.api.nvim_set_keymap("n", "<A-h>", "<cmd>TmuxNavigateLeft<CR>", { noremap = true, desc = "window left" })
-- vim.api.nvim_set_keymap("n", "<A-j>", "<cmd>TmuxNavigateDown<CR>", { noremap = true, desc = "window down" })
-- vim.api.nvim_set_keymap("n", "<A-k>", "<cmd>TmuxNavigateUp<CR>", { noremap = true, desc = "window up" })
-- vim.api.nvim_set_keymap("n", "<A-l>", "<cmd>TmuxNavigateRight<CR>", { noremap = true, desc = "window right" })

vim.keymap.set("n", "<Leader>fe", function()
	local file = vim.fn.expand("<cfile>")

	-- Get image dimensions
	local dims = vim.fn.system("identify -format '%w %h' " .. vim.fn.shellescape(file))
	local width, height = dims:match("(%d+) (%d+)")

	if width and height then
		-- Double the dimensions
		width = tonumber(width)
		height = tonumber(height)
		-- Construct and execute the feh command
		local cmd = string.format("feh -B White --geometry %dx%d %s &", width, height, vim.fn.shellescape(file))
		vim.fn.system(cmd)
	else
		print("Failed to get image dimensions. Opening with default size.")
		vim.fn.system("feh -B White " .. vim.fn.shellescape(file) .. " &")
	end
end, { silent = true, desc = "Open image under cursor with feh (double size)" })

vim.keymap.set("n", "<Leader>fE", function()
	local file = vim.fn.expand("<cfile>")

	-- Get image dimensions
	local dims = vim.fn.system("identify -format '%w %h' " .. vim.fn.shellescape(file))
	local width, height = dims:match("(%d+) (%d+)")

	if width and height then
		-- Double the window dimensions
		width = tonumber(width) * 3
		height = tonumber(height) * 3

		-- Construct and execute the feh command with zoom
		local cmd =
			string.format("feh -B White --geometry %dx%d --zoom 200 %s &", width, height, vim.fn.shellescape(file))
		vim.fn.system(cmd)
	else
		print("Failed to get image dimensions. Opening with default size.")
		vim.fn.system("feh -B White --zoom 200 " .. vim.fn.shellescape(file) .. " &")
	end
end, { silent = true, desc = "Open image under cursor with feh (2x window, 2x zoom)" })

vim.opt.conceallevel = 1 -- or 2, if you prefer
vim.api.nvim_set_keymap("n", "<F5>", ":w<CR>:!rustc % && ./%:t:r<CR>", { noremap = true, silent = false })
-- Map Ctrl+' to save and run the current file
vim.api.nvim_set_keymap("n", "<C-Enter>", ":w<CR>:!rustc % && ./%:t:r<CR>", { noremap = true, silent = false })

-- use cap Z as '%' in insert mode and % as Z
local function set_keymap_for_modes(modes, key1, key2)
	for _, mode in ipairs(modes) do
		vim.api.nvim_set_keymap(mode, key1, key2, { noremap = true })
		vim.api.nvim_set_keymap(mode, key2, key1, { noremap = true })
	end
end

-- Define the modes
local all_modes = { "n", "v", "x", "s", "o", "i", "c" }

-- Set Z and % mappings
set_keymap_for_modes(all_modes, "Z", "%")
vim.api.nvim_set_keymap("i", "<C-J>", "<Esc>", { noremap = true })
-- vim.api.nvim_set_keymap("v", "<C-J>", "<Esc>", { noremap = true })

vim.keymap.set("n", "H", "^", { noremap = true })
vim.keymap.set("v", "H", "^", { noremap = true })
vim.keymap.set("n", "L", "$", { noremap = true })
vim.keymap.set("v", "L", "$h", { noremap = true })

-- vim.keymap.set("n", "yy", "mj0y$'j", { noremap = true, silent = true })
vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "G", "Gzz", { noremap = true })
-- vim.keymap.set("n", "<c-d>", "<c-d>zz", { noremap = true })
-- vim.keymap.set("n", "<c-u>", "<c-u>zz", { noremap = true })

vim.keymap.set("n", "<leader>aa", ":CompetiTest receive problem<CR>", { desc = "add problem" })
vim.keymap.set("n", "<leader>ac", ":CompetiTest receive contest<CR>", { desc = "add contest" })
vim.keymap.set("n", "<leader>ar", ":CompetiTest run<CR>", { desc = "run program" })

vim.keymap.set("i", "<c-p>", function()
	require("telescope.builtin").registers()
end, { noremap = true, silent = false, desc = "search registers" })

vim.keymap.set(
	"n",
	"<leader>up",
	':let @+ = expand("%:p")<CR>:lua print("Copied path to: " .. vim.fn.expand("%:p"))<CR>',
	{ desc = "copy path and file name to clipboard", silent = false }
)
vim.keymap.set("n", "<leader>vca", function()
	vim.lsp.buf.code_action()
end)

vim.keymap.set("n", "<leader>ah", ":lua require('harpoon.mark').add_file()<cr>", { desc = "add to harpoon" })

vim.keymap.set("n", "<leader>ai", ":lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = "toggle harpoon" })
vim.keymap.set("n", "<a-b>", ":lua require('harpoon.ui').nav_next()<cr>", { desc = "harpoon next" })
vim.keymap.set("n", "<a-n>", ":lua require('harpoon.ui').nav_prev()<cr>", { desc = "harpoon before" })

-- { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
vim.keymap.set("n", "<C-f>", ":Telescope find_files<CR>", { desc = "Find File" })
vim.keymap.set("n", "<C-b>", ":Telescope file_browser<CR>", { desc = "File Browser" })

-- create a new empty lines
vim.keymap.set("n", "<CR>", '@="m`o<C-V><Esc>``"<CR>')
vim.keymap.set("n", "<S-CR>", '@="m`O<C-V><Esc>``"<CR>')
