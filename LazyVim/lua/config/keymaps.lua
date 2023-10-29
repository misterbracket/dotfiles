-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

return {
  n = {
    ["<C-d>"] = { "<C-d>zz", desc = "Scroll down" },
    ["<C-u>"] = { "<C-u>zz", desc = "Scroll up" },
    ["<S-l>"] = { "<cmd>bnext<cr>", desc = "Next Buffer" },
    ["<S-h>"] = { "<cmd>bprev<cr>", desc = "Previous Buffer" },
  },
}
