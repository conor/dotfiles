-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Alt+l → vertical split
map("n", "<A-l>", "<cmd>vsplit<cr>", { desc = "Vertical Split" })

-- Alt+j → horizontal split
map("n", "<A-j>", "<cmd>split<cr>", { desc = "Horizontal Split" })
