function nix-dev
  # use the current shell when starting `nix-shell`
  echo "Initializing nix devshell with $SHELL"
  nix develop -c $SHELL
end
