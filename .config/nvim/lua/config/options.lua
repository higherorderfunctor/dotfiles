-- This file is automatically loaded by plugins.core

local opt = vim.opt

opt.clipboard = "unnamedplus" -- sync with system clipboard
opt.colorcolumn = "120" -- show column and line length
opt.completeopt = "menu,menuone,noselect" -- always show autocomplete menu and force user to select
opt.conceallevel = 3 -- hide * markup for bold and italic
opt.cursorline = true -- enable highlighting of the current line
opt.expandtab = true -- use spaces instead of tabs
opt.mouse = "a" -- enable mouse mode
opt.number = true -- show line numbers
opt.shiftround = true -- round indent
opt.shiftwidth = 2 -- size of an indent
opt.smartindent = true -- insert indents automatically
opt.tabstop = 2 -- number of spaces tabs count for
opt.termguicolors = true -- true color support
-- TODO how is textwidth set?
opt.formatoptions = "jcroqlnt" -- j - unwrap comments when it makes sense
-- c - auto-wrap comments
-- r - auto-insert comment leader with <Enter>
-- o - auto-insert comment leader with 'o' or 'O'
-- q - format comments with "gq"
-- l - do not auto-format pre-existing long lines in insert mode
-- n - numbered list support
-- t - auto-wrap text
opt.grepformat = "%f:%l:%c:%m" -- ripgrep format
opt.grepprg = "rg --vimgrep" -- ripgrep, high-performance
opt.ignorecase = true -- ignore case when pattern matching
opt.inccommand = "nosplit" -- preview incremental substitutes
opt.laststatus = 3 -- global statusline
opt.list = true -- show some invisible characters (tabs...
opt.pumblend = 10 -- popup blend
opt.pumheight = 10 -- maximum number of entries in a popup
opt.relativenumber = true -- relative line numbers
opt.scrolloff = 4 -- vertical scroll padding from cursor to end edge of pane
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shortmess:append({
	I = true, -- suppress startup intro
	c = true, -- suppress messages while scanning
	C = true, -- suppress messages while scanning
})
opt.showmode = false -- dont show mode since we have a statusline
opt.sidescrolloff = 4 -- horizontal scroll padding from cursor to edge of pane
opt.smartcase = true -- don't ignore case with capitals when pattern matching
opt.spelllang = { "en" } -- spellcheck language
opt.splitbelow = true -- put new windows below current
opt.splitkeep = "screen" -- keep the text on the same screen line
opt.splitright = true -- put new windows right of current
opt.timeoutlen = 300 -- how long to wait for a sequence to complete
opt.undofile = true -- persistent undo
opt.undolevels = 10000 -- number of undo levels (default: 1000)
opt.updatetime = 200 -- save swap file and trigger CursorHold
opt.virtualedit = "block" -- allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- command-line completion mode
opt.winminwidth = 5 -- minimum window width
opt.wrap = false -- disable line wrap
opt.fillchars = {
	foldopen = "",
	foldclose = "",
	-- fold = "⸱", TODO when chance to mess with fold
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}

if vim.fn.has("nvim-0.10") == 1 then
	opt.smoothscroll = true
end

-- Folding
vim.foldlevel = 99
-- vim.opt.foldtext = "v:lua.require'lazyvim.util'.ui.foldtext()"
--
-- if vim.fn.has("nvim-0.9.0") == 1 then
--   vim.opt.statuscolumn = [[%!v:lua.require'lazyvim.util'.ui.statuscolumn()]]
-- end
--
-- -- HACK: causes freezes on <= 0.9, so only enable on >= 0.10 for now
-- if vim.fn.has("nvim-0.10") == 1 then
--   vim.opt.foldmethod = "expr"
--   vim.opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
-- else
--   vim.opt.foldmethod = "indent"
-- end
--
-- vim.o.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()"

-- fix markdown indentation settings
vim.g.markdown_recommended_style = 0
