return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.utility.noice-nvim" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
  -- customizations
  {
    "catppuccin",
    opts = {
      flavour = "mocha",
      no_italic = true,
    },
  },
  {
    "simrat39/rust-tools.nvim",

    opts = {
      tools = {
        inlay_hints = {
          auto = false,
        },
      },
    },
  },
}
