local map = vim.keymap.set

-- Remap arrow keys in insert mode
map("i", "<A-l>", "<Right>", { noremap = true })
map("i", "<A-h>", "<Left>", { noremap = true })
map("i", "<A-k>", "<Up>", { noremap = true })
map("i", "<A-j>", "<Down>", { noremap = true })

map("i", "<C-h>", "<C-w>", { noremap = true }) -- Delete the previous wordkey
map("n", "<Tab>", ":bnext<CR>", { noremap = true }) -- Navigate to the next buffer
map("n", "<S-Tab>", ":bprevious<CR>", { noremap = true }) -- Navigate to the previous buffer

-- Remap tmux-like navigation keys
-- vim.api.nvim_set_keymap("n", "<A-h>", "<cmd>TmuxNavigateLeft<CR>", { noremap = true, desc = "window left" })
-- vim.api.nvim_set_keymap("n", "<A-j>", "<cmd>TmuxNavigateDown<CR>", { noremap = true, desc = "window down" })
-- vim.api.nvim_set_keymap("n", "<A-k>", "<cmd>TmuxNavigateUp<CR>", { noremap = true, desc = "window up" })
-- vim.api.nvim_set_keymap("n", "<A-l>", "<cmd>TmuxNavigateRight<CR>", { noremap = true, desc = "window right" })

map("n", "<Leader>fe", function()
  local file = vim.fn.expand "<cfile>"

  -- Get image dimensions
  local dims =
    vim.fn.system("identify -format '%w %h' " .. vim.fn.shellescape(file))
  local width, height = dims:match "(%d+) (%d+)"

  if width and height then
    -- Double the dimensions
    width = tonumber(width)
    height = tonumber(height)
    -- Construct and execute the feh command
    local cmd = string.format(
      "feh -B White --geometry %dx%d %s &",
      width,
      height,
      vim.fn.shellescape(file)
    )
    vim.fn.system(cmd)
  else
    print "Failed to get image dimensions. Opening with default size."
    vim.fn.system("feh -B White " .. vim.fn.shellescape(file) .. " &")
  end
end, { silent = true, desc = "Open image under cursor with feh (double size)" })

map("n", "<Leader>fE", function()
  local file = vim.fn.expand "<cfile>"

  -- Get image dimensions
  local dims =
    vim.fn.system("identify -format '%w %h' " .. vim.fn.shellescape(file))
  local width, height = dims:match "(%d+) (%d+)"

  if width and height then
    -- Double the window dimensions
    width = tonumber(width) * 3
    height = tonumber(height) * 3

    -- Construct and execute the feh command with zoom
    local cmd = string.format(
      "feh -B White --geometry %dx%d --zoom 200 %s &",
      width,
      height,
      vim.fn.shellescape(file)
    )
    vim.fn.system(cmd)
  else
    print "Failed to get image dimensions. Opening with default size."
    vim.fn.system(
      "feh -B White --zoom 200 " .. vim.fn.shellescape(file) .. " &"
    )
  end
end, {
  silent = true,
  desc = "Open image under cursor with feh (2x window, 2x zoom)",
})

vim.opt.conceallevel = 1 -- or 2, if you prefer
map(
  "n",
  "<F5>",
  ":w<CR>:!rustc % && ./%:t:r<CR>",
  { noremap = true, silent = false }
)
-- Map Ctrl+' to save and run the current file
map(
  "n",
  "<C-Enter>",
  ":w<CR>:!rustc % && ./%:t:r<CR>",
  { noremap = true, silent = false }
)

-- use cap Z as '%' in insert mode and % as Z
local function set_keymap_for_modes(modes, key1, key2)
  for _, mode in ipairs(modes) do
    map(mode, key1, key2, { noremap = true })
    map(mode, key2, key1, { noremap = true })
  end
end

-- Define the modes
local all_modes = { "n", "v", "x", "s", "o", "i", "c" }

-- Set Z and % mappings
set_keymap_for_modes(all_modes, "Z", "%")
vim.api.nvim_set_keymap("i", "<C-J>", "<Esc>", { noremap = true })
map("v", "<Leader>w", "<Cmd>w<CR>", { silent = true, desc = "Save buffer" })
map(
  "v",
  "<Leader>q",
  "<Cmd>confirm q<CR>",
  { silent = true, desc = "Quit Window" }
)

map("n", "H", "^", { noremap = true })
map("v", "H", "^", { noremap = true })
map("n", "L", "$", { noremap = true })
map("v", "L", "$h", { noremap = true })

-- vim.keymap.set("n", "yy", "mj0y$'j", { noremap = true, silent = true })
map("n", "x", '"_x', { noremap = true, silent = true })
map({ "n", "v" }, "G", "Gzz", { noremap = true })
-- vim.keymap.set("n", "<c-d>", "<c-d>zz", { noremap = true })
-- vim.keymap.set("n", "<c-u>", "<c-u>zz", { noremap = true })

map(
  "n",
  "<leader>aa",
  ":CompetiTest receive problem<CR>",
  { desc = "add problem" }
)
map(
  "n",
  "<leader>ac",
  ":CompetiTest receive contest<CR>",
  { desc = "add contest" }
)
map("n", "<leader>ar", ":CompetiTest run<CR>", { desc = "run program" })

map(
  "i",
  "<c-p>",
  function() require("telescope.builtin").registers() end,
  { noremap = true, silent = false, desc = "search registers" }
)

map(
  "n",
  "<leader>up",
  ':let @+ = expand("%:p")<CR>:lua print("Copied path to: " .. vim.fn.expand("%:p"))<CR>',
  { desc = "copy path and file name to clipboard", silent = false }
)
map(
  "n",
  "<leader>va",
  function() vim.lsp.buf.code_action() end,
  { desc = "code action" }
)

map(
  "n",
  "<leader>ah",
  ":lua require('harpoon.mark').add_file()<cr>",
  { desc = "add to harpoon" }
)

map(
  "n",
  "<leader>ai",
  ":lua require('harpoon.ui').toggle_quick_menu()<cr>",
  { desc = "toggle harpoon" }
)
map(
  "n",
  "<a-b>",
  ":lua require('harpoon.ui').nav_next()<cr>",
  { desc = "harpoon next" }
)
map(
  "n",
  "<a-n>",
  ":lua require('harpoon.ui').nav_prev()<cr>",
  { desc = "harpoon before" }
)

-- { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
map("n", "<C-f>", ":Telescope find_files<CR>", { desc = "Find File" })
map("n", "<C-b>", ":Telescope file_browser<CR>", { desc = "File Browser" })

-- create a new empty lines
-- map("n", "<CR>", '@="m`o<C-V><Esc>``"<CR>')
-- map("n", "<S-CR>", '@="m`O<C-V><Esc>``"<CR>')

vim.cmd [[autocmd FileType * set formatoptions-=ro]]

-- local wk = require("which-key")

-- wk.register({
-- 	["<leader>j"] = {
-- 		name = "Java",
-- 		-- Code actions
-- 		o = { "<cmd>lua vim.lsp.buf.organize_imports()<CR>", "Organize Imports" },
-- 		v = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Actions" },
-- 		f = { "<cmd>lua vim.lsp.buf.format()<CR>", "Format" },
--
-- 		-- Test
-- 		t = {
-- 			name = "Test",
-- 			c = { "<cmd>lua vim.lsp.buf.execute_command({command = 'java.test.editor.run'})<CR>", "Test Class" },
-- 			m = { "<cmd>lua vim.lsp.buf.execute_command({command = 'java.test.editor.run.method'})<CR>", "Test Method" },
-- 		},
--
-- 		-- Debug/Run
-- 		d = {
-- 			name = "Debug",
-- 			b = {
-- 				"<cmd>lua vim.lsp.buf.execute_command({command = 'java.debug.toggleBreakpoint'})<CR>",
-- 				"Toggle Breakpoint",
-- 			},
-- 		},
--
-- 		-- Maven commands
-- 		m = {
-- 			name = "Maven",
-- 			c = { "<cmd>TermExec cmd='mvn clean'<CR>", "Clean" },
-- 			i = { "<cmd>TermExec cmd='mvn install'<CR>", "Install" },
-- 			t = { "<cmd>TermExec cmd='mvn test'<CR>", "Test" },
-- 			p = { "<cmd>TermExec cmd='mvn package'<CR>", "Package" },
-- 		},
--
-- 		-- Spring Boot
-- 		s = {
-- 			name = "Spring",
-- 			r = { "<cmd>TermExec cmd='mvn spring-boot:run'<CR>", "Run" },
-- 			d = { "<cmd>TermExec cmd='mvn spring-boot:run -Dspring-boot.run.profiles=dev'<CR>", "Run Dev" },
-- 			t = { "<cmd>TermExec cmd='mvn spring-boot:test'<CR>", "Test" },
-- 		},
--
-- 		-- Build
-- 		b = { "<cmd>TermExec cmd='mvn clean install -DskipTests'<CR>", "Build Skip Tests" },
-- 		i = { "<cmd>TermExec cmd='mvn clean install'<CR>", "Build With Tests" },
-- 	},
-- })
