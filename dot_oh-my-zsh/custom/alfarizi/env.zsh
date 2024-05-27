# This is for general environment variables
# =========================================

# [General]
export PATH="$HOME/bin:$PATH"
export TERMINAL="/usr/bin/konsole"
export EDITOR="vim"

# [Electron]
# This is necessary if you work with wayland
export ELECTRON_OZONE_PLATFORM_HINT="wayland"
export ELECTRON_ENABLE_WAYLAND=1
export ELECTRON_OZONE_PLATFORM="wayland"

# [NVM: Node Version Manager]
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
