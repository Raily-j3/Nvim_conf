local map = vim.keymap.set

local function cmd(command)
  return table.concat { '<Cmd>', command, '<CR>' }
end

map('n', '<leader>qq', cmd 'qa', { desc = 'Quit All' })
map({ 'i', 'x', 'n', 's' }, '<C-s>', cmd 'w', { desc = 'Save file' })

-- window
map('n', '<leader>d', '<C-W>c', { desc = 'Delete window', remap = true })
map('n', '<leader>w', cmd 'bd', { desc = 'Delete Buffer and Window' })
-- map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- line move
map('n', '<C-A-j>', '<cmd>m .+1<cr>', { desc = 'Move down' })
map('n', '<C-A-k>', '<cmd>m .-2<cr>', { desc = 'Move up' })
map('i', '<C-A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move down' })
map('i', '<C-A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move up' })
map('v', '<C-A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move down' })
map('v', '<C-A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move up' })
map('v', '<', '<gv')
map('v', '>', '>gv')

-- cursor move
map({ 'n', 'v' }, 'H', '_', { desc = '' })
map({ 'n', 'v' }, 'L', 'g_', { desc = '' })
map({ 'n', 'v' }, 'J', '5j', { desc = '' })
map({ 'n', 'v' }, 'K', '5k', { desc = '' })
map({ 'n' }, '<C-d>', '8<C-e>', { desc = '' })
map({ 'n' }, '<C-u>', '8<C-y>', { desc = '' })

map({ 'n', 'x' }, '<leader>p', '"0p')
map(
  { 'i', 'n' },
  '<esc>',
  '<cmd>noh<cr><esc>',
  { desc = 'Escape and Clear hlsearch' }
)

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go { severity = severity }
  end
end

map('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Line Diagnostics' })
map('n', ']e', diagnostic_goto(true, 'ERROR'), { desc = 'Next Error' })
map('n', '[e', diagnostic_goto(false, 'ERROR'), { desc = 'Prev Error' })
map('n', ']w', diagnostic_goto(true, 'WARN'), { desc = 'Next Warning' })
map('n', '[w', diagnostic_goto(false, 'WARN'), { desc = 'Prev Warning' })

vim.keymap.set('n', '<leader>uf', cmd 'FormatEnable')
vim.keymap.set('n', '<leader>uF', cmd 'FormatDisable')

vim.keymap.set('n', '<C-f>', cmd 'WindowsMaximize')

vim.keymap.set('n', '<C-w>_', cmd 'WindowsMaximizeVertically')
vim.keymap.set('n', '<C-w>|', cmd 'WindowsMaximizeHorizontally')
vim.keymap.set('n', '<C-w>=', cmd 'WindowsEqualize')
vim.keymap.set('n', '<leader>h', cmd 'LocalHighlightToggle')
