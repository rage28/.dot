local config = function()
  local lsp = require("lsp-zero").preset({})

  lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
  end)

  lsp.ensure_installed({
    "bashls",
    "dockerls",
    "eslint",
    "golangci_lint_ls", -- Golang
    "html",
    "jsonls",
    "jdtls", -- Java
    "tsserver", -- Javascript
    "lua_ls",
    "marksman", -- Markdown
    "pyright",
    "rust_analyzer",
    "sqlls",
    "taplo", -- TOML
    "lemminx", -- XML
    "yamlls",
  })

  require("lspconfig").lua_ls.setup({
    settings = {
      Lua = {
        diagnostics = { globals = { "vim" } }
      }
    }
  })

  lsp.setup()
end

return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v2.x",
  dependencies = {
    { "neovim/nvim-lspconfig" },
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate",
    },
    { "williamboman/mason-lspconfig.nvim" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "L3MON4D3/LuaSnip" },
  },
  config = config
}
