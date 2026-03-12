-- return {
--   'blazkowolf/gruber-darker.nvim',
--   priority = 1000,
--   config = function()
--     vim.cmd [[colorscheme gruber-darker]]
--   end,
-- }
-- return {
--   'EdenEast/nightfox.nvim',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd [[colorscheme nordfox]]
--     -- vim.cmd([[colorscheme nightfox]])
--   end,
-- }
-- return {
--   'rebelot/kanagawa.nvim',
--   lazy = false,
--   priority = 1000,
--   config = function()
-- 	vim.cmd [[colorscheme kanagawa-wave]]
-- 	-- vim.cmd [[colorscheme kanagawa-dragon]]
-- 	-- vim.cmd [[colorscheme kanagawa-lotus]]
--   end,
-- }
-- return {
--   "thesimonho/kanagawa-paper.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {},
--   config = function()
	-- vim.cmd [[colorscheme kanagawa-paper]]
-- 	-- vim.cmd [[colorscheme kanagawa-paper-ink]]
-- 	-- vim.cmd [[colorscheme kanagawa-paper-canvas]]
--   end,
-- }
return {
  'projekt0n/github-nvim-theme',
  name = 'github-theme',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('github-theme').setup({
      -- ...
    })

    vim.cmd('colorscheme github_dark')
  end,
}
