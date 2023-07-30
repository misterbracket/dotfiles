return {
  "windwp/nvim-ts-autotag",
  branch = "main",
  requires = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function() require("nvim-ts-autotag").setup() end,
}
