-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

    ["<leader>ff"] = {
      "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
      desc = "Find File",
    },
    ["<C-d>"] = { "<C-d>zz", desc = "Scroll down" },
    ["<C-u>"] = { "<C-u>zz", desc = "Scroll up" },
    ["<S-l>"] = { "<cmd>bnext<cr>", desc = "Next Buffer" },
    ["<S-h>"] = { "<cmd>bprev<cr>", desc = "Previous Buffer" },

    -- Harpoon
    ["<space>r"] = { "<cmd>lua require'harpoon.ui'.toggle_quick_menu()<CR>", desc = "Open Harpoon" },
    ["<space>m"] = { "<cmd>lua require'harpoon.mark'.add_file()<CR>", desc = "Harpoon add file" },
    ["<S-Tab>"] = { "<cmd>lua require'harpoon.ui'.nav_prev()<CR>", desc = "Harpoon prev file" },
    ["<Tab>"] = { "<cmd>lua require'harpoon.ui'.nav_next()<CR>", desc = "Harpoon next file" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
