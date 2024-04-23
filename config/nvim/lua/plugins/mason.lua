-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      local core = require "astrocore"
      core.list_insert_unique(opts.ensure_installed, {
        "lua_ls",
        "golangci_lint_ls",
        "gopls",
        "pylsp",
        "rust_analyzer",
        "tsserver",
        "vimls",
      })
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      require("astrocore").list_insert_unique(opts.ensure_installed, {
        "golangci-lint",
        "markdownlint",
        "eslint_d",
        "pylint",
        "gofumpt",
        "goimports",
        "gomodifytags",
        "gotests",
        "isort",
        "stylua",
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      require("astrocore").list_insert_unique(opts.ensure_installed, {
        "python",
        "codelldb",
        "go-debug-adapter",
      })
    end,
  },
}
