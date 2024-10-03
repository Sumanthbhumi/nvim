if vim.g.neovide then
	-- Helper function for transparency formatting
	vim.g.neovide_padding_top = 0
	vim.g.neovide_padding_bottom = 0
	vim.g.neovide_padding_right = 0
	vim.g.neovide_padding_left = 0
	vim.g.gui_font_default_size = 11
	vim.g.gui_font_size = vim.g.gui_font_default_size
	vim.g.gui_font_face = "Fira Code Retina"

	-- -- Helper function for transparency formatting
	local alpha = function()
		return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
	end

	-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
	vim.g.neovide_transparency = 0.8
	vim.g.transparency = 0.9
	vim.g.neovide_background_color = "#1e1e2e" .. alpha()
	vim.g.neovide_window_blurred = true

	RefreshGuiFont = function()
		vim.opt.guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)
	end

	vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
	vim.cmd.colorscheme("catppuccin")
	ResizeGuiFont = function(delta)
		vim.g.gui_font_size = vim.g.gui_font_size + delta
		RefreshGuiFont()
	end

	ResetGuiFont = function()
		vim.g.gui_font_size = vim.g.gui_font_default_size
		RefreshGuiFont()
	end

	-- Call function on startup to set default value
	ResetGuiFont()

	-- Keymaps

	local opts = { noremap = true, silent = true }

	vim.keymap.set({ "n" }, "<C-BS>", function()
		ResizeGuiFont(1)
	end, opts)
	vim.keymap.set({ "n" }, "<C-->", function()
		ResizeGuiFont(-1)
	end, opts)
	vim.keymap.set({ "n" }, "<C-+>", function()
		ResetGuiFont()
	end, opts)
	vim.opt.wildignore:append("**/image.lua")
end
