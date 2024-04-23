set SHELL $HOME/.nix-profile/bin/fish
set PATH $HOME/nightly/nvim-macos/bin $PATH

set PATH $HOME/.nix-profile/bin $PATH
set PATH /nix/var/nix/profiles/default/bin $PATH

set -U EDITOR "vi"

alias vi="nvim"
alias vim="nvim"
alias lg="lazygit"
# alias youtube-dl='python3 /usr/local/bin/youtube-dl'
alias netchk="ping 8.8.8.8"
alias git-graph="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias ls='eza --icons -F -H --group-directories-first --git -1'

$HOME/.nix-profile/bin/starship init fish | source
$HOME/.nix-profile/bin/zoxide init --cmd cd fish | source
