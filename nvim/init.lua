--TODO
-- There is a bug where the LSP does not reset on write
-- The work around is a macro that resets the LSP server on every write which is really bad
--
-- I'm not sure if this is a bug but I can't view the LSP error messages in Telescope diagnostics
-- So i created a keymap that uses vim's diagnostic.open_float() instead to view the full error
-- this is necessary when opening multiple files in the same window
--
-- Maybe optimze paste keymaps? not sure yet
--
-- Might want to get splitting this config file up into multiple files as a nvim project would 
vim.g.mapleader = " "
---- Keymaps -----
-- Keymap to toggle paste mode on or off
vim.api.nvim_set_keymap('n', '<leader>p', ':set paste!<CR>', { noremap = true, silent = true })

-- Keymap to explicitly turn off paste mode
vim.api.nvim_set_keymap('n', '<leader>o', ':set nopaste<CR>', { noremap = true, silent = true })

-- Keymap to explicitly show floating diagnostic window for LSP errors/warnings
vim.api.nvim_set_keymap('n', '<leader>e', ':lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
-- Bring up the Telescope diag window
vim.api.nvim_set_keymap('n', '<leader>E', ':Telescope diagnostics<CR>', { noremap = true, silent = true })

---- END Keymaps -----
---- This is a crude export of vimrc to init.lua ----
-- Enable syntax highlighting
vim.cmd('syntax on')

-- Line numbers
vim.o.number = true

-- Tabs and indentation
vim.o.tabstop = 4        -- Number of spaces that a <Tab> in the file counts for
vim.o.shiftwidth = 4     -- Number of spaces to use for autoindent and shifting
vim.o.expandtab = false  -- Do not convert tabs to spaces

-- Highlight search results
vim.o.hlsearch = true
-- Toggle search highlight with <F3>
vim.api.nvim_set_keymap('n', '<F3>', ':set hlsearch!<CR>', { noremap = true, silent = true })

-- Show cursor position in the status line
vim.o.ruler = true

-- Incremental search
vim.o.incsearch = true

-- Enable automatic indentation
vim.o.autoindent = true

-- Enable filetype-specific plugins and indenting
vim.cmd('filetype plugin indent on')

---- END crude export of vimrc to init.lua ----
 


--- BEGIN PLUGINS ----
-- Bootstrap Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Configure plugins using Lazy.nvim
require("lazy").setup({
  -- Plugin manager itself
  { "folke/lazy.nvim" },

  -- File Explorer
  { "nvim-tree/nvim-tree.lua" },

  -- Fuzzy Finder
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },

  -- Syntax Highlighting
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- LSP and Completion
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" }, -- Snippet engine

  -- Git Integration
  { "lewis6991/gitsigns.nvim" },

  -- Status Line
    { "nvim-lualine/lualine.nvim" },
  -- Gruvbox Install
	{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true }
--
--  -- Autopairs
--  { "windwp/nvim-autopairs" },
--
--  -- Commenting
--  { "numToStr/Comment.nvim" },
--
--  -- Debugging
--  { "mfussenegger/nvim-dap" },
--  { "rcarriga/nvim-dap-ui" },
})

-- General settings
vim.o.completeopt = "menu,menuone,noselect"


-- LSP Configuration
local lspconfig = require("lspconfig")
lspconfig.clangd.setup({})

-- Treesitter Configuration
require("nvim-treesitter.configs").setup({
  ensure_installed = { "c", "cpp" }, -- Install parsers for C/C++
  highlight = { enable = true },
})

-- Completion Configuration
local cmp = require("cmp")
cmp.setup({
  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
	['<Tab>'] = cmp.mapping.select_next_item(),    -- Next item
	['<S-Tab>'] = cmp.mapping.select_prev_item(),  -- Previous item
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
  sources = { { name = "nvim_lsp" }, { name = "buffer" } },
})

-- Git Signs
 require("gitsigns").setup()

-- Status Line
require('lualine').setup({
	options = {
		theme = 'gruvbox', -- Use a theme that adapts to the background
		globalstatus = true, -- Make the status line span the entire width (Neovim 0.7+)
	},
})

-- Auto Pairs
--require("nvim-autopairs").setup()

-- Commenting
--require("Comment").setup()

-- Gruvbox
require("gruvbox").setup({
	overrides={
	}
})
--- END PLUGINS ----
-- Restart LSP on write for only C and C++ files
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.c", "*.cpp" }, -- Add file patterns here
  callback = function()
    vim.cmd("LspRestart")
  end,
})

vim.cmd([[colorscheme gruvbox]])
vim.opt.guicursor = ""
