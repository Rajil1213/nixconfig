{ pkgs, ... }: {
  # This is required information for home-manager to do its job
  home = {
    stateVersion = "23.11";
    username = "rajil";
    homeDirectory = "/Users/rajil";
    packages = with pkgs; [
      jq
      eza
      fzf
      git
      wget
      fish 
      zellij
      zoxide
      neovim
      lazygit
      starship
      alacritty 
      # uncomment following line when neovim 0.10 is released: https://github.com/neovim/neovim/milestone/36
      # neovim
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
}
