-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

return {
  vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" }),
  vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" }),
  vim.keymap.set("n", "<leader>/", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>"),
}
