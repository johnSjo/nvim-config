-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- My keymaps

vim.keymap.set('n', '<C-d>', '<C-d>zz', { silent = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { silent = true })
vim.keymap.set('n', '<C-y>', 'kzz', { silent = true })
vim.keymap.set('n', '<C-e>', 'jzz', { silent = true })

-- moving lines
vim.keymap.set('n', '<C-j>', ':m+1<CR>==', { silent = true })
vim.keymap.set('n', '<C-k>', ':m-2<CR>==', { silent = true })
vim.keymap.set('v', '<C-j>', ":m'>+1<CR>`<my`>gv=gv", { silent = true })
vim.keymap.set('v', '<C-k>', ':m-2<CR>==gv', { silent = true })
-- moving lines for mac
vim.keymap.set('n', '∆', ':m+1<CR>==', { silent = true })
vim.keymap.set('n', '˚', ':m-2<CR>==', { silent = true })
vim.keymap.set('v', '∆', ":m'>+1<CR>`<my`>gv=gv", { silent = true })
vim.keymap.set('v', '˚', ':m-2<CR>==gv', { silent = true })

vim.keymap.set({ 'n', 'i' }, '<C-s>', '<cmd>write<cr>', {})
vim.keymap.set('v', 'p', '"_dP', {})

vim.keymap.set('n', '<CR>', 'o<Esc>', {})
