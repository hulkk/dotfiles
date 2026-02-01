#!/bin/bash

# Color codes (Gruvbox-friendly)
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
CYAN='\033[1;36m'
MAGENTA='\033[1;35m'
RESET='\033[0m'

# Read JSON data from stdin (provided by Claude Code)
read -r input

# Extract data using jq (single call for performance)
IFS=$'\t' read -r model current_dir current_version tokens_used context_size percentage <<< \
  "$(echo "$input" | jq -r '[
    .model.display_name // "Unknown",
    .workspace.current_dir // "~",
    .version // "unknown",
    .context_window.total_input_tokens // 0,
    .context_window.context_window_size // 200000,
    .context_window.used_percentage // 0
  ] | @tsv')"
dir_name=$(basename "$current_dir")

# Format tokens as "24k/200k"
format_tokens() {
  local tokens=$1
  if [ "$tokens" -ge 1000 ]; then
    echo "$((tokens / 1000))k"
  else
    echo "$tokens"
  fi
}

tokens_display="$(format_tokens "$tokens_used")/$(format_tokens "$context_size")"

# Check for updates via Homebrew (cache for 1 hour to avoid excessive checks)
cache_file="$HOME/.claude/version_check_cache"
cache_duration=3600  # 1 hour in seconds
latest_version=""

fetch_latest_version() {
  # Query Homebrew for the latest available version of Claude Code CLI
  /opt/homebrew/bin/brew info --json=v2 claude-code 2>/dev/null | \
    jq -r '(.casks[0].version // .formulae[0].versions.stable) // empty' 2>/dev/null
}

if [ -f "$cache_file" ]; then
  cache_age=$(($(date +%s) - $(stat -f %m "$cache_file")))

  if [ $cache_age -lt $cache_duration ]; then
    # Use cached result
    latest_version=$(cat "$cache_file")
  else
    # Cache expired, check again
    latest_version=$(fetch_latest_version)
    [ -n "$latest_version" ] && echo "$latest_version" > "$cache_file"
  fi
else
  # No cache, check for the first time
  latest_version=$(fetch_latest_version)
  mkdir -p "$HOME/.claude"
  [ -n "$latest_version" ] && echo "$latest_version" > "$cache_file"
fi

# Build update section only if update is available
update_section=""
if [ -n "$latest_version" ] && [ "$latest_version" != "$current_version" ]; then
  # Simple version comparison (works for semantic versioning)
  if [ "$(printf '%s\n' "$latest_version" "$current_version" | sort -V | head -n1)" != "$latest_version" ]; then
    update_section=" | ${MAGENTA}update to: ${latest_version}${RESET}"
  fi
fi

# Choose color based on usage percentage
if [ "$percentage" -lt 50 ]; then
  ctx_color="$GREEN"
elif [ "$percentage" -lt 75 ]; then
  ctx_color="$YELLOW"
else
  ctx_color="$RED"
fi

# Output the statusline
printf "${CYAN}%s${RESET} | ${BLUE}%s${RESET} | ${ctx_color}%s${RESET}%b\n" \
  "$dir_name" \
  "$model" \
  "$tokens_display" \
  "$update_section"
