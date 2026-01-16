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
set PATH "/Applications/Docker.app/Contents/Resources/bin" $PATH

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

# Downloaded binaries
fish_add_path $HOME/bin

# THEME
set fish_color_autosuggestion brblack
set fish_color_cancel -r
set fish_color_command blue
set fish_color_comment red
set fish_color_cwd green
set fish_color_cwd_root red
set fish_color_end green
set fish_color_error brred
set fish_color_escape brcyan
set fish_color_history_current --bold
set fish_color_host normal
set fish_color_host_remote yellow
set fish_color_normal normal
set fish_color_operator brcyan
set fish_color_param cyan
set fish_color_quote yellow
set fish_color_redirection cyan --bold
set fish_color_search_match white --background=brblack
set fish_color_selection white --bold --background=brblack
set fish_color_status red
set fish_color_user brgreen
set fish_color_valid_path --underline
set fish_pager_color_completion normal
set fish_pager_color_description yellow -i
set fish_pager_color_prefix normal --bold --underline
set fish_pager_color_progress brwhite --background=cyan
set fish_pager_color_selected_background -r

