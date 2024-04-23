# nixconf

This is my config for using Nix as a package and dotfiles manager in MacOS. The
package management is done via `nix` itself (with flakes) while the dotfiles are
managed using [`home-manager`](https://github.com/nix-community/home-manager).

## Installation

1. Install nix

   > Disclaimer: this step creates a separate volume in MacOS where `/nix` is
   > mounted and where all the packages and configurations are stored.

   ```bash
   curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
   ```

2. Run `home-manager` and set up
   Make sure that you change the username to match your own (mine is `rajil`).

   ```bash
   nix run github:nix-community/home-manager -- switch --flake .
   ```

You should now be able to run `home-manager` directly from the shell (zsh/fish).

## Customizations

### Adding packages

Packages can be added by appending packages from the [nix package registry](https://search.nixos.org/packages)
to the `packages` list in [`home.nix`](./home.nix).

### Adding dotfiles

Your configuration dotfiles are hardlinked to the nix store whenever you perform
a switch operation. The files in the store are created based on the contents of
the [config](./config) directory recursively due to a configuration defined in
[home.nix](./home.nix). Adding dotfiles is a two-step process:

1. Add whatever you wish to add to your `~/.config` directory inside the
   [./config](./config) directory in this repo.

2. Run `home-manager` to switch config:

```bash
home-manager switch --flake </path/to/this/repo>
```
