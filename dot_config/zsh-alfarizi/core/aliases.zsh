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
alias nvide="/usr/bin/neovide &"
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

alias bunx="/usr/bin/bunx --bun"

# [Redis]
redis() {
  case "$1" in
    start)
      redis-server --daemonize yes
      echo "Redis started on 127.0.0.1:6379"
      ;;
    stop)
      redis-cli shutdown
      echo "Redis is stopped"
      ;;
    restart)
      redis-cli shutdown && redis-server --daemonize yes
      echo "Redis restarted on 127.0.0.1:6379"
      ;;
    status)
      if redis-cli ping | grep -q "PONG"; then
        echo "Redis is running on 127.0.0.1:6379"
      else
        echo "Redis is not running"
      fi
      ;;
    status-all)
      echo "Checking all Redis processes..."
      ps aux | grep redis
      ;;
    *)
      echo "Usage: redis {start|stop|restart|status|status-all}"
      ;;
  esac
}

# [Kubernetes]
alias k="kubectl"
# enhance autocomplete for kubectl
complete -F __start_kubectl k
alias kg="kubectl get"
alias kga="kubectl get all"
alias ka="kubectl apply -f"
alias kdes="kubectl describe"
alias krm="kubectl delete"

alias kw="kubectl get --watch"
complete -F __start_kubectl kw

# [Docker compose]
alias doco="docker compose"
complete -F __start_docker_compose doco
