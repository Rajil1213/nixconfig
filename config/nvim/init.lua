-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"

return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  -- lsp = {
  --   -- customize lsp formatting options
  --   formatting = {
  --     -- control auto formatting on save
  --     format_on_save = {
  --       enabled = true, -- enable or disable format on save globally
  --       allow_filetypes = { -- enable format on save for specified filetypes only
  --         "go",
  --         "rust",
  --         "vue",
  --         "typescript",
  --         "javascript",
  --       },
  --       ignore_filetypes = { -- disable format on save for specified filetypes
  --         -- "python",
  --       },
  --     },
  --     disabled = { -- disable formatting capabilities for the listed language servers
  --       -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
  --       -- "lua_ls",
  --       "prettierd",
  --       "ts_ls",
  --       "volar",
  --     },
  --     timeout_ms = 1000, -- default format timeout
  --     -- filter = function(client) -- fully override the default formatting function
  --     --   return true
  --     -- end
  --   },
  --   -- enable servers that you already have installed without mason
  --   servers = {
  --     -- "pyright"
  --   },
  --   config = {
  --     rust_analyzer = {
  --       settings = {
  --         ["rust-analyzer"] = {
  --           cargo = {
  --             buildScripts = {
  --               enable = true,
  --             },
  --           },
  --           procMacro = {
  --             enable = true,
  --           },
  --           checkOnSave = {
  --             enable = true,
  --             command = "cargo clippy --all-features --workspace --tests --benches --examples",
  --           },
  --           inlayHints = {
  --             enable = true,
  --           },
  --           diagnostics = {
  --             enable = true,
  --           },
  --         },
  --       },
  --     },
  --     vue = {
  --       settings = {
  --         vue = {
  --           inlayHints = {
  --             missingProps = true,
  --             inlineHandlerLeading = true,
  --             optionsWrapper = true,
  --           },
  --           autoInsert = {
  --             dotValue = true,
  --           },
  --           takeOverMode = {
  --             enabled = true,
  --           },
  --         },
  --       },
  --     },
  --     ts_ls = {
  --       settings = {
  --         typescript = {
  --           inlayHints = {
  --             includeInlayEnumMemberValueHints = true,
  --             includeInlayFunctionLikeReturnTypeHints = true,
  --             includeInlayFunctionParameterTypeHints = true,
  --             includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
  --             includeInlayParameterNameHintsWhenArgumentMatchesName = false,
  --             includeInlayPropertyDeclarationTypeHints = true,
  --             includeInlayVariableTypeHints = true,
  --             includeInlayVariableTypeHintsWhenTypeMatchesName = false,
  --             auto = false,
  --           },
  --           format = {
  --             insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = false,
  --             insertSpaceBeforeFunctionParenthesis = true,
  --           },
  --         },
  --
  --         javascript = {
  --           inlayHints = {
  --             includeInlayEnumMemberValueHints = true,
  --             includeInlayFunctionLikeReturnTypeHints = true,
  --             includeInlayFunctionParameterTypeHints = true,
  --             includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
  --             includeInlayParameterNameHintsWhenArgumentMatchesName = false,
  --             includeInlayPropertyDeclarationTypeHints = true,
  --             includeInlayVariableTypeHints = true,
  --             includeInlayVariableTypeHintsWhenTypeMatchesName = false,
  --             auto = false,
  --           },
  --           format = {
  --             insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = false,
  --             insertSpaceBeforeFunctionParenthesis = true,
  --           },
  --         },
  --       },
  --     },
  --     hls = {
  --       settings = {
  --         ["haskell-language-server"] = {
  --           formattingProvider = "fourmolu",
  --         },
  --       },
  --     },
  --   },
  -- },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}
