set PATH $HOME/.nix-profile/bin $PATH
# set PATH $HOME/Library/pnpm $PATH
# set PATH /usr/local/bin $PATH
# set PATH $HOME/.cargo/bin $PATH
# set PATH $HOME/nightly/nvim-macos/bin $PATH
# set PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
# 
# set -x PNPM_HOME $HOME/Library/pnpm
# 
# set -x GOPATH $HOME/go
# set PATH $GOPATH/bin $PATH
# 
# set -x PYENV_ROOT $HOME/.pyenv
# set PATH $PYENV_ROOT/bin $PATH

set -U EDITOR "vi"

alias vi="nvim"
alias vim="nvim"
alias lg="lazygit"
# alias youtube-dl='python3 /usr/local/bin/youtube-dl'
alias netchk="ping 8.8.8.8"
alias vpnchk="ping 10.99.0.1"
alias git-graph="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias ls='exa --icons -F -H --group-directories-first --git -1'

$HOME/.nix-profile/bin/starship init fish | source
# /usr/local/bin/kubectl completion fish | source
$HOME/.nix-profile/bin/zoxide init --cmd cd fish | source
