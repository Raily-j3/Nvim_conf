-- return {
--   'blazkowolf/gruber-darker.nvim',
--   priority = 1000,
--   config = function()
--     vim.cmd [[colorscheme gruber-darker]]
--   end,
-- }
return {
  'EdenEast/nightfox.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd [[colorscheme nordfox]]
    -- vim.cmd([[colorscheme nightfox]])
  end,
}
