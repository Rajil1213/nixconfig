set PATH $HOME/.nix-profile/bin $PATH
set PATH /nix/var/nix/profiles/default/bin $PATH

set -gx FOUNDRY_DIR $HOME/.foundry
set PATH $HOME/.foundry/bin $PATH

set PATH /usr/local/bin $PATH

set -gx PNPM_HOME $HOME/.pnpm-store
set PATH $PNPM_HOME $PATH
set PATH $HOME/.pnpm-store/bin $PATH

set PATH $HOME/Library/Python/3.9/bin $PATH

set -gx BTC_HOME "$HOME/Library/Application Support/Bitcoin"

set PATH $HOME/.cargo/bin $PATH

# after installing mactex-no-gui
set PATH /usr/local/texlive/2024/bin/universal-darwin $PATH

set -U EDITOR "vi"

alias vi="nvim"
alias vim="nvim"
alias lg="lazygit"
alias youtube-dl='python3 /usr/local/bin/youtube-dl'
alias netchk="ping 8.8.8.8"
alias git-graph="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias ls='eza --icons -F -H --group-directories-first --git -1'

$HOME/.nix-profile/bin/starship init fish | source
$HOME/.nix-profile/bin/zoxide init --cmd cd fish | source

eval "$(/opt/homebrew/bin/brew shellenv)"

fish_add_path /opt/homebrew/opt/llvm/bin
set -gx LDFLAGS "-L/opt/homebrew/opt/llvm/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/llvm/include"
