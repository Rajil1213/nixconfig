set PATH $HOME/.nix-profile/bin $PATH
set PATH /nix/var/nix/profiles/default/bin $PATH

set -gx FOUNDRY_DIR $HOME/.foundry
set PATH $HOME/.foundry/bin $PATH

set PATH /usr/local/bin $PATH

set -gx PNPM_HOME $HOME/.pnpm-store
set PATH $PNPM_HOME $PATH
set PATH $HOME/.pnpm-store/bin $PATH

set -Ux PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin

set -gx BTC_HOME "$HOME/Library/Application Support/Bitcoin"

set PATH $HOME/.cargo/bin $PATH

set PATH $HOME/.local/share/nvim/mason/bin $PATH

# haskell
set PATH $HOME/.ghcup/bin $PATH
set PATH $HOME/.cabal/bin $PATH

# sp1 prover
set PATH $HOME/.sp1/bin $PATH

# xdg for most binary confs
set XDG_CONFIG_HOME $HOME/.config

set PATH "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" $PATH

set -U EDITOR "vi"

alias vi="nvim"
alias vim="nvim"
alias lg="lazygit"
alias netchk="ping 8.8.8.8"
alias git-graph="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias ls='eza --icons -F -H --group-directories-first --git -1'

eval "$(/opt/homebrew/bin/brew shellenv)"

fish_add_path /opt/homebrew/opt/llvm/bin
set -gx LDFLAGS "-L/opt/homebrew/opt/llvm/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/llvm/include"

$HOME/.nix-profile/bin/starship init fish | source
$HOME/.nix-profile/bin/zoxide init --cmd cd fish | source
pyenv init - | source
