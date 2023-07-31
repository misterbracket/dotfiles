return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- null_ls.builtins.diagnostics.cspell.with {
      --   extra_args = { "--config", "~/.cspell.json" },
      -- },
      -- null_ls.builtins.code_actions.cspell.with {
      --   extra_args = { "--config", "~/.cspell.json" },
      -- },
      null_ls.builtins.formatting.stylua,
    }
    -- set null-ls timeout
    config.timeout = 3000
    return config -- return final config table
  end,
}