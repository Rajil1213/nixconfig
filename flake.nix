{
  description = "Rajil's dotfiles";

  # inputs are other flakes you use within your own flake, dependencies
  # if you will
  inputs = {
    # unstable has the 'freshest' packages you will find, even the AUR
    # doesn't do as good as this, and it's all precompiled.
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    ghostty.url = "github:ghostty-org/ghostty";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # In this context, outputs are mostly about getting home-manager what it
  # needs since it will be the one using the flake
  outputs = { nixpkgs, home-manager, ghostty, ... }: {
    # the following are not working for some reason
    homeConfigurations = {
      "rajil" = home-manager.lib.homeManagerConfiguration {
        # darwin is the macOS kernel and aarch64 means ARM, i.e. apple silicon
        pkgs = import nixpkgs {
          system = "aarch64-darwin";
          overlays = [
            (final: prev: {
              ghostty = ghostty.packages.aarch64-darwin.default;
            })  
          ];
        };

        modules = [ 
          ./home.nix 
          ({ pkgs, ... }: {
            home.packages = with pkgs; [
              ghostty
            ];
          })
        ];
      };
    };
  };
}
