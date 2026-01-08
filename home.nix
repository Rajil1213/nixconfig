{ pkgs, nixkpkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  # This is required information for home-manager to do its job
  home = {
    stateVersion = "25.05";
    username = "rajil";
    homeDirectory = "/Users/rajil";
    packages = with pkgs; [
      # system packages
      jq
      yq
      fd
      eza
      fzf
      git
      gh
      uv
      act
      dust
      entr
      jujutsu
      wget
      btop
      fish
      just
      yazi
      delta
      zellij
      zoxide
      lazygit
      difftastic
      ripgrep
      starship
      neofetch

      # tools
      pango
      ffmpeg_7
      unrar

      # applications
      alacritty
      neovim
      viu
      aerospace
      # ghostty.packages.aarch64-darwin.default # FIXME: uncomment once supported
      # zed-editor # this is marked as broken

      # aws infra
      awscli2
      eksctl

      # dev packages
      # nodejs # just use pnpm as the node manager
      corepack
      rustup
      cargo-nextest
      cargo-audit
      cargo-watch
      # TODO: uncomment when unbroken
      # cargo-llvm-cov
      cargo-hack
      cargo-mutants
      go
      solc-select
      bitcoin
      poetry
      pprof
      graphviz # needed for pprof

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
      tree-sitter # for some lua packages

      # optional tools
      tokei # code counter

      # temp
      exercism
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
    settings = {
      alias = {
        graph = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all";
        s = "status";
        ci = "commit";
        co = "checkout";
      };
      user = {
        name = "Rajil Bajracharya";
        email = "imrb1213@gmail.com";
      };
    };
  };
}
