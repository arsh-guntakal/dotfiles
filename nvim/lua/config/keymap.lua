vim.g.mapleader = " "

local keymap = vim.keymap

-- General Keymaps
keymap.set('n', '<leader>p', ':set paste!<CR>', { desc = "Toggle paste mode" })
keymap.set('n', '<leader>o', ':set nopaste<CR>', { desc = "Turn off paste mode" })
keymap.set('n', '<F3>', ':set hlsearch!<CR>', { desc = "Toggle search highlight" })

-- LSP & Diagnostics
keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic" })
keymap.set('n', '<leader>R', ':LspRestart<CR>', { desc = "Restart LSP" })

-- Plugin Keymaps
keymap.set('n', '<leader><Tab>', ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
keymap.set('n', '<leader>E', ':Telescope diagnostics<CR>', { desc = "Telescope diagnostics" })
