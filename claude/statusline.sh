#!/bin/bash

# Read JSON data from stdin (provided by Claude Code)
read -r input

# Extract data using jq (install with: brew install jq or apt-get install jq)
model=$(echo "$input" | jq -r '.model.display_name // "Unknown"')
current_dir=$(echo "$input" | jq -r '.workspace.current_dir // "~"')
dir_name=$(basename "$current_dir")

# Extract context window information
context_used=$(echo "$input" | jq -r '.context_window.used // 0')
context_limit=$(echo "$input" | jq -r '.context_window.limit // 200000')

# Calculate percentage
if [ "$context_limit" -gt 0 ]; then
  percentage=$((context_used * 100 / context_limit))
else
  percentage=0
fi

# Color codes
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
CYAN='\033[1;36m'
RESET='\033[0m'

# Choose color based on usage
if [ "$percentage" -lt 50 ]; then
  ctx_color="$GREEN"
elif [ "$percentage" -lt 75 ]; then
  ctx_color="$YELLOW"
else
  ctx_color="$RED"
fi

# Format tokens with commas for readability
context_used_fmt=$(printf "%'d" "$context_used")
context_limit_fmt=$(printf "%'d" "$context_limit")

# Output the statusline
printf "${CYAN}%s${RESET} | ${BLUE}%s${RESET} | ${ctx_color}%s/%s (${percentage}%%)${RESET}" \
  "$dir_name" \
  "$model" \
  "$context_used_fmt" \
  "$context_limit_fmt"
