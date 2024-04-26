{ pkgs, ... }: {
  # This is required information for home-manager to do its job
  home = {
    stateVersion = "23.11";
    username = "rajil";
    homeDirectory = "/Users/rajil";
    packages = with pkgs; [
      # system packages
      jq
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

      # applications
      alacritty 
      # uncomment following line when neovim 0.10 is released: https://github.com/neovim/neovim/milestone/36
      # neovim

      # dev packages
      nodejs
      corepack
      rustup
      cargo-nextest
      cargo-audit
      cargo-risczero
      go
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
