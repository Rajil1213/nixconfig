{ pkgs, nixkpkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  # This is required information for home-manager to do its job
  home = {
    stateVersion = "23.11";
    username = "rajil";
    homeDirectory = "/Users/rajil";
    packages = with pkgs; [
      # system packages
      jq
      yq
      eza
      fzf
      git
      wget
      btop
      fish 
      zellij
      zoxide
      lazygit
      ripgrep
      starship
      neofetch

      # tools
      pango
      ffmpeg_5
      unrar

      # applications
      alacritty 
      neovim

      # dev packages
      # nodejs # just use pnpm as the node manager
      corepack
      rustup
      cargo-nextest
      cargo-audit
      cargo-watch
      cargo-risczero
      # TODO: uncomment when unbroken
      # cargo-llvm-cov
      cargo-hack
      cargo-mutants
      go
      solc-select
      bitcoin
      poetry

      ## manim deps
      ### using nix for python is messy
      # python3
      # python3Packages.pip
      # python3Packages.scipy
      # python3Packages.jupyterlab
      # python3Packages.ipython
      # python3Packages.ipykernel

      # build tools
      protobuf
      #TODO: uncomment once clang support is better in Nix
      # llvmPackages.libclang
      # llvm
      # clang
      # autoconf
      # automake
      libtool
      boost
      libevent
      openssl
      zlib
    ];

    # Tell it to map everything in the `config` directory in this
    # repository to the `.config` in my home directory
    file.".config" = { source = ./config; recursive = true; };
  };
  # This is to ensure programs are using ~/.config rather than
  # /Users/<username>/Library/whatever
  xdg.enable = true;

  programs.home-manager.enable = true;
  # I use fish, but bash and zsh work just as well here. This will setup
  # the shell to use home-manager properly on startup, neat!
  programs.fish.enable = true;
  programs.zsh.enable = true;

  programs.git = {
    enable = true;
    userName = "Rajil Bajracharya";
    userEmail = "imrb1213@gmail.com";
  };
}
