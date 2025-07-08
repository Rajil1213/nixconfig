return {
  "jameswalls/naysayer.nvim",
  name = "naysayer",
  opts = {
    flavour = "naysayer",
    no_italic = false,
    no_bold = false,
    no_underline = false,
    transparent_background = true,
    background = {
      light = "naysayer",
      dark = "naysayer",
    },
    integrations = {
      cmp = true,
      gitsigns = true,
      treesitter = true,
      notify = true,
      markdown = true,
    },
  }
}
