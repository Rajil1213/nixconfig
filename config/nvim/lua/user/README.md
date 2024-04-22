# AstroNvim User Configuration Example

My [AstroNvim](https://github.com/AstroNvim/AstroNvim) config customized from the configuration [user_example](https://github.com/AstroNvim/user_example) template.

## 🛠️ Installation

### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

### Clone AstroNvim

```shell
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
```

### Clone the repository

```shell
git clone https://github.com/Rajil1213/astrovim.config ~/.config/nvim/lua/user
```

#### Start Neovim

```shell
nvim
```

## Customizations

Here are my customizations present in this config:

- The theme is set to `catppuccin-mocha`.
- `Neotest` has been configured with `rust`, `go` and `python`, and custom
  keybindings (from LazyVim).
- LSPs have been added for `rust`, `python`, `go`, and `typescript`.
- `ToggleTerm` keybinding has been remapped to `<leader>-\` which now opens
  the terminal vertically.
- Support for `rust`, `go` and `python` has been added to treesitter.
- Color column has been set to `100` and wrapping has been enabled.
- Floating commandline has been added by virtue of `noice-nvim` (from community).
- `<esc><esc>` takes you into the normal mode in the terminal (mapped to `<C-\><C-n>`).
- Increase size of the terminal to 100 (best for larger screens).
- `U` to redo what has been undone with `u`.
- Add `markdown` pack.
- Use `clippy` as the linter for `rust_analyzer`.
- Add inlay hints to `JS`/`TS` in `tsserver`.
- Remove space from between empty braces in `JS/TS`.
- Add vitest.
  to find `function` definitions.
- Add [`nvim-coverage`](https://github.com/andythigpen/nvim-coverage) to
  display coverage, and add keybindings for it, namespaced by `<leader>t`.
