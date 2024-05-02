{
  description = "Rajil's dotfiles";

  # inputs are other flakes you use within your own flake, dependencies
  # if you will
  inputs = {
    # unstable has the 'freshest' packages you will find, even the AUR
    # doesn't do as good as this, and it's all precompiled.
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # In this context, outputs are mostly about getting home-manager what it
  # needs since it will be the one using the flake
  outputs = { nixpkgs, home-manager, ... }: {
    # the following are not working for some reason
    # TODO: Get these to work
    # nativeBuildInputs = with nixpkgs.legacyPackages.aarch64-darwin; [
    #   llvm
    #   darwin.apple_sdk.frameworks.System
    #   llvmPackages.libclang
    #   pkg-config
    # ];
    # buildInputs = with nixpkgs.legacyPackages.aarch64-darwin; [
    #   hidapi
    #   llvm
    #   llvmPackages.libclang
    #   darwin.apple_sdk.frameworks.System
    #   darwin.apple_sdk.frameworks.Security
    #   darwin.apple_sdk.frameworks.CoreFoundation
    #   darwin.apple_sdk.frameworks.CoreServices
    #   openssl
    #   zlib
    # ];

    homeConfigurations = {
      "rajil" = home-manager.lib.homeManagerConfiguration {
        # darwin is the macOS kernel and aarch64 means ARM, i.e. apple silicon
        pkgs = nixpkgs.legacyPackages.aarch64-darwin;
        modules = [ ./home.nix ];
      };
    };
  };
}
