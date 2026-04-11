local map = vim.keymap.set
local function cmd(command)
  return table.concat { '<Cmd>', command, '<CR>' }
end

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
map({ 'n' }, '<C-d>', '8<C-e>', { desc = '' })
map({ 'n' }, '<C-u>', '8<C-y>', { desc = '' })

-- Diagnostic
map('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Line Diagnostics' })
map('n', '[w', function() vim.diagnostic.jump { count = -1, severity = 'WARN' } end, { desc = 'Prev Warning' })
map('n', ']w', function() vim.diagnostic.jump { count = 1, severity = 'WARN' } end, { desc = 'Next Warning' })
map('n', '[e', function() vim.diagnostic.jump { count = -1, severity = 'ERROR' } end, { desc = 'Prev Error' })
map('n', ']e', function() vim.diagnostic.jump { count = 1, severity = 'ERROR' } end, { desc = 'Prev Error' })

map('n', '<C-p>', cmd 'ClangdSwitchSourceHeader')
map('n', '<leader>cc', cmd 'let @+ = expand("%:t")')
map('n', '<leader>cp', cmd 'let @+ = expand("%:p")')
map('n', '<leader>ss', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
