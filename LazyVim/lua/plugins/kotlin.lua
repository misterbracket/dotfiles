return {
  -- LSP config for kotlin-lsp
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        kotlin_language_server = {
          cmd = { "kotlin-lsp" },
          filetypes = { "kotlin" },
        },
      },
    },
  },
}
