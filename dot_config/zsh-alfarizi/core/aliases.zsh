# This is for general aliases
# ============================

# [General]
alias cls="clear"
alias wwr="wezterm cli rename-workspace"

# [Tmux]
# alias t='tmux new-session "export TERM=xterm-256color; exec zsh"'
alias t='tmux new-session "export TERM=xterm-256color; exec zsh"'

# [(Neo)vim]
alias vim="~/.local/share/bob/nvim-bin/nvim"
alias ovim="/usr/bin/vim"
alias nvide="/usr/bin/neovide"
# alias vimg="wezterm start --always-new-process $HOME/.local/share/bob/nvim-bin/nvim"
# alias code="kitty -e ~/.local/share/bob/nvim-bin/nvim"

# What inside it?
# - Parentheses and the ">/dev/null 2>&1" make the execution quite
# - The "&" at the end will make the main terminal to not wait vim closed
alias vimg="(kitty -e ~/.local/share/bob/nvim-bin/nvim >/dev/null 2>&1 &)"

# [Shortcut to certain directory]
alias @work="cd ~/dev/work"
alias @nextjs="cd ~/dev/web-dev/next-app"
alias @ovpn="cd ~/openvpn"
alias @dotfiles="cd ~/.local/share/chezmoi"
alias @bin="cd ~/bin"
