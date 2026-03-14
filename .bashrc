# Dotfiles
alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# Homebrew
alias bud='brew update'
alias bug='brew upgrade'

# Docker
alias drm='docker rm -f'
alias drma='docker rm -f $(docker ps -aq)'
alias dbclaude='docker build -t claude .'

# Bash completion
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

# Drop into the claude container
claude-docker() {
  local project="${1:-.}"
  shift 2>/dev/null
  local proj_name="$(basename "$(cd "$project" && pwd)")"
  local name="claude-${proj_name}"

  if docker ps -a --format '{{.Names}}' | grep -q "^${name}$"; then
    docker start -ai "$name"
  else
    docker run -it --name "$name" \
      -v "$(cd "$project" && pwd):/workspace/${proj_name}" \
      -v claude-home:/home/claude \
      -w "/workspace/${proj_name}" \
      "$@" \
      claude
  fi
}
