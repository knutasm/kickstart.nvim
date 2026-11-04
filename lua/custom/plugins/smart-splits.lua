-- Seamless Ctrl+h/j/k/l between nvim windows and kitty splits.
-- Kitty side lives in ~/.config/kitty/kitty.conf (neighboring_window maps + remote control).

---@module 'lazy'
---@type LazySpec
return {
  'mrjones2014/smart-splits.nvim',
  lazy = false, -- must load at startup so kitty sees the IS_NVIM user variable
  config = function()
    local ss = require 'smart-splits'
    ss.setup {}
    -- Override kickstart's <C-w> maps from init.lua
    vim.keymap.set('n', '<C-h>', ss.move_cursor_left, { desc = 'Move focus left (nvim/kitty)' })
    vim.keymap.set('n', '<C-j>', ss.move_cursor_down, { desc = 'Move focus down (nvim/kitty)' })
    vim.keymap.set('n', '<C-k>', ss.move_cursor_up, { desc = 'Move focus up (nvim/kitty)' })
    vim.keymap.set('n', '<C-l>', ss.move_cursor_right, { desc = 'Move focus right (nvim/kitty)' })
  end,
}
