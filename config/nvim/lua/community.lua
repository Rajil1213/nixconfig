return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.pack.typescript" },
  -- { import = "astrocommunity.pack.python" },
  -- { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.go" },
  -- { import = "astrocommunity.pack.haskell" }, -- has issues with neotest-haskell
  -- { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.pack.toml" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
  -- customizations
  {
    "catppuccin",
    opts = {
      flavour = "macchiato",
      no_italic = true,
    },
  },
}
