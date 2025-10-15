-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- DO NOT USE `LazyVim.safe_keymap_set` IN YOUR OWN CONFIG!!
-- use `vim.keymap.set` instead
local map = vim.keymap.set

-- save file
map("n", "<leader>w", "<cmd>w<cr><esc>", { desc = "Save File" })

-- save file and quit
map("n", "<leader>wq", "<cmd>wq<cr><esc>", { desc = "Save && Quit" })
