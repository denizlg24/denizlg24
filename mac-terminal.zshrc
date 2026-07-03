
# ----------------------------------------
# Oh My Zsh
# ----------------------------------------

export ZSH="$HOME/.oh-my-zsh"

# Theme handled by Oh My Posh, so Oh My Zsh theme is disabled.
ZSH_THEME=""

# Optional: update behavior
# zstyle ':omz:update' mode reminder
# zstyle ':omz:update' frequency 13

# Optional: faster Git status in very large repos
# DISABLE_UNTRACKED_FILES_DIRTY="true"


# ----------------------------------------
# Oh My Zsh plugins
# ----------------------------------------

plugins=(
  git
  gh
  git-lfs
  brew
  macos
  sudo
  command-not-found
  docker
  docker-compose
  node
  npm
  python
  postgres
  zsh-autosuggestions
  fzf-tab
  zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"


# ----------------------------------------
# Homebrew paths
# ----------------------------------------

# Apple Silicon Homebrew
if [[ -d "/opt/homebrew/bin" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi


# ----------------------------------------
# Language/tool environments
# ----------------------------------------

# uv
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

# Cargo / Rust
[ -d "$HOME/.cargo/bin" ] && export PATH="$HOME/.cargo/bin:$PATH"

# Bun
[ -d "$HOME/.bun/bin" ] && export PATH="$HOME/.bun/bin:$PATH"


# ----------------------------------------
# Shell enhancements
# ----------------------------------------

# fzf-tab
if [[ -f "/opt/homebrew/share/fzf-tab/fzf-tab.plugin.zsh" ]]; then
  source "/opt/homebrew/share/fzf-tab/fzf-tab.plugin.zsh"
fi

# Zsh autosuggestions
if [[ -f "/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
  source "/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

# Zsh syntax highlighting
if [[ -f "/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
  source "/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi


# ----------------------------------------
# Prompt
# ----------------------------------------

if command -v oh-my-posh >/dev/null 2>&1; then
  eval "$(oh-my-posh init zsh --config "$HOME/.config/forest_cozy_v4.omp.json")"
fi


# ----------------------------------------
# Personal aliases
# ----------------------------------------

alias zshconfig="code ~/.zshrc"
alias reloadzsh="source ~/.zshrc"
alias c="clear"

alias ll="ls -lah"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git pull"

alias dev="bun dev"
alias build="bun run build"
alias lint="bun run lint"

alias dc="docker compose"
alias dcu="docker compose up"
alias dcd="docker compose down"

