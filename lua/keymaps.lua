local map = vim.keymap.set
local function cmd(command) return table.concat { '<Cmd>', command, '<CR>' } end

map('n', '<leader>qq', cmd 'qa', { desc = 'Quit All' })
map('n', '<leader>w', cmd 'bd', { desc = 'Delete Buffer and Window' })
map({ 'i', 'x', 'n', 's' }, '<C-s>', cmd 'w', { desc = 'Save file' })
map({ 'n', 'x' }, '<leader>p', '"0p')
map({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and Clear hlsearch' })

-- Line move
map('n', '<C-A-j>', '<cmd>m .+1<cr>', { desc = 'Move down' })
map('n', '<C-A-k>', '<cmd>m .-2<cr>', { desc = 'Move up' })
map('i', '<C-A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move down' })
map('i', '<C-A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move up' })
map('v', '<C-A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move down' })
map('v', '<C-A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move up' })
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Cursor move
map({ 'n', 'v' }, 'H', '_', { desc = '' })
map({ 'n', 'v' }, 'L', 'g_', { desc = '' })
map({ 'n', 'v' }, 'J', '5j', { desc = '' })
map({ 'n', 'v' }, 'K', '5k', { desc = '' })
map({ 'n' }, '<C-d>', '8<C-e>', { desc = '' })
map({ 'n' }, '<C-u>', '8<C-y>', { desc = '' })

-- Diagnostic
map('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Line Diagnostics' })
map('n', '[w', function() vim.diagnostic.jump { count = -1, severity = 'WARN' } end, { desc = 'Prev Warning' })
map('n', ']w', function() vim.diagnostic.jump { count = 1, severity = 'WARN' } end, { desc = 'Next Warning' })
map('n', '[e', function() vim.diagnostic.jump { count = -1, severity = 'ERROR' } end, { desc = 'Prev Error' })
map('n', ']e', function() vim.diagnostic.jump { count = 1, severity = 'ERROR' } end, { desc = 'Prev Error' })

-- Windows
map('n', '<C-f>', cmd 'WindowsMaximize')
map('n', '<C-w>_', cmd 'WindowsMaximizeVertically')
map('n', '<C-w>|', cmd 'WindowsMaximizeHorizontally')
map('n', '<C-w>=', cmd 'WindowsEqualize')
map('n', '<leader>h', cmd 'LocalHighlightToggle')

-- Format
local format_enabled = true
local function toggle_format()
  format_enabled = not format_enabled
  vim.cmd(format_enabled and 'FormatEnable' or 'FormatDisable')
  vim.notify(format_enabled and 'Formatting Enabled' or 'Formatting Disabled', vim.log.levels.INFO)
end
vim.keymap.set('n', '<leader>uf', toggle_format, { desc = 'Toggle Format Enable/Disable' })
