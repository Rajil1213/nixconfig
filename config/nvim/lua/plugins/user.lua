return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "nvim-neotest/neotest",
    ft = { "go", "rust", "python", "vitest" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "rouge8/neotest-rust",
      "nvim-neotest/neotest-go",
      "nvim-neotest/neotest-python",
      "marilari88/neotest-vitest",
      {
        "folke/neodev.nvim",
        opts = function(_, opts)
          opts.library = opts.library or {}
          if opts.library.plugins ~= true then
            opts.library.plugins = require("astrocore").list_insert_unique(opts.library.plugins, { "neotest" })
          end
          opts.library.types = true
        end,
      },
    },
    opts = function()
      return {
        -- your neotest config here
        adapters = {
          require "neotest-go" {
            args = { "-count=1", "-timeout=60s" },
          },
          require "neotest-rust" {
            args = { "--nocapture" },
          },
          require "neotest-python" {},
          require "neotest-vitest" {
            filter_dir = function(name, _rel_path, _root) return name ~= "node_modules" end,
          },
        },
        status = { virtual_text = true },
        output = { open_on_run = true },
        quickfix = {
          open = function()
            if require("lazyvim.util").has "trouble.nvim" then
              vim.cmd "Trouble quickfix"
            else
              vim.cmd "copen"
            end
          end,
        },
      }
    end,
    config = function(_, opts)
      -- get neotest namespace (api call creates or returns namespace)
      local neotest_ns = vim.api.nvim_create_namespace "neotest"
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }, neotest_ns)

      if opts.adapters then
        local adapters = {}
        for name, config in pairs(opts.adapters or {}) do
          if type(name) == "number" then
            if type(config) == "string" then config = require(config) end
            adapters[#adapters + 1] = config
          elseif config ~= false then
            local adapter = require(name)
            if type(config) == "table" and not vim.tbl_isempty(config) then
              local meta = getmetatable(adapter)
              if adapter.setup then
                adapter.setup(config)
              elseif meta and meta.__call then
                adapter(config)
              else
                error("Adapter " .. name .. " does not support setup")
              end
            end
            adapters[#adapters + 1] = adapter
          end
        end
        opts.adapters = adapters
      end

      require("neotest").setup(opts)
    end,
    -- stylua: ignore
    keys = {
        { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File" },
        { "<leader>tT", function() require("neotest").run.run(vim.loop.cwd()) end, desc = "Run All Test Files" },
        { "<leader>tr", function() require("neotest").run.run() end, desc = "Run Nearest" },
        { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Summary" },
        { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output" },
        { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel" },
        { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop" },
      },
  },
  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { neotest = true } },
  },
  {
    "hrsh7th/nvim-cmp",

    opts = {
      confirm_opts = {
        select = true,
      },
    },
  },
  {
    "akinsho/toggleterm.nvim",

    opts = {
      size = 100,
    },
  },
  {
    "andythigpen/nvim-coverage",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
      require("coverage").setup {
        commands = true,
        highlights = {
          -- customize highlight groups created by the plugin
          covered = { fg = "#55CDA0" }, -- supports style, fg, bg, sp (see :h highlight-gui)
          uncovered = { fg = "#F07178" },
        },
        signs = {
          -- use your own highlight groups or text markers
          covered = { hl = "CoverageCovered", text = "▎" },
          uncovered = { hl = "CoverageUncovered", text = "▎" },
        },
        summary = {
          -- customize the summary pop-up
          min_coverage = 80.0, -- minimum coverage threshold (used for highlighting)
        },
        lang = {
          -- customize language specific settings
        },
      }
    end,

    -- load when LSP is attached
    event = { "LspAttach" },
    keys = {
      { "<leader>tC", "<cmd>Coverage<cr>", desc = "Show Coverage" },
      { "<leader>tc", "<cmd>CoverageToggle<cr>", desc = "Toggle Coverage" },
    },
  },
  {
    "kylechui/nvim-surround",

    config = function() require("nvim-surround").setup {} end,
    event = { "User AstroFile" },
  },
  {
    "folke/trouble.nvim",

    config = function() require("trouble").setup {} end,
    event = { "User AstroFile" },
  },
}
