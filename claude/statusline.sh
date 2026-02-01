#!/bin/bash

# Read JSON data from stdin (provided by Claude Code)
read -r input

# Extract data using jq
model=$(echo "$input" | jq -r '.model.display_name // "Unknown"')
current_dir=$(echo "$input" | jq -r '.workspace.current_dir // "~"')
dir_name=$(basename "$current_dir")
current_version=$(echo "$input" | jq -r '.version // "unknown"')

# Extract context window information
context_used=$(echo "$input" | jq -r '.context_window.used // 0')
context_limit=$(echo "$input" | jq -r '.context_window.limit // 200000')

# Calculate percentage
if [ "$context_limit" -gt 0 ]; then
  percentage=$((context_used * 100 / context_limit))
else
  percentage=0
fi

# Calculate time until reset (Claude Code uses 5-hour blocks)
current_hour=$(date +%H)
current_minute=$(date +%M)

# Calculate minutes since midnight
minutes_since_midnight=$((current_hour * 60 + current_minute))

# Claude Code resets every 5 hours starting at midnight (0, 5, 10, 15, 20)
block_start_hours=(0 5 10 15 20)
next_reset_hour=0

for hour in "${block_start_hours[@]}"; do
  block_minutes=$((hour * 60))
  if [ $minutes_since_midnight -lt $block_minutes ]; then
    next_reset_hour=$hour
    break
  fi
done

# If we're in the last block (20:00-23:59), next reset is at midnight
if [ $next_reset_hour -eq 0 ] && [ $current_hour -ge 20 ]; then
  next_reset_hour=24  # Tomorrow's midnight
fi

# Calculate time remaining
next_reset_minutes=$((next_reset_hour * 60))
minutes_remaining=$((next_reset_minutes - minutes_since_midnight))

# Convert to hours and minutes
hours_remaining=$((minutes_remaining / 60))
mins_remaining=$((minutes_remaining % 60))

# Format reset time in 24-hour format
if [ $next_reset_hour -eq 24 ]; then
  reset_time="00:00"
else
  reset_time=$(printf "%02d:00" "$next_reset_hour")
fi

# Check for updates (cache for 1 hour to avoid excessive npm calls)
cache_file="$HOME/.claude/version_check_cache"
cache_duration=3600  # 1 hour in seconds
latest_version=""

if [ -f "$cache_file" ]; then
  # Check if cache exists and get its age
  if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    cache_age=$(($(date +%s) - $(stat -f %m "$cache_file" 2>/dev/null)))
  else
    # Linux
    cache_age=$(($(date +%s) - $(stat -c %Y "$cache_file" 2>/dev/null)))
  fi
  
  if [ $cache_age -lt $cache_duration ]; then
    # Use cached result
    latest_version=$(cat "$cache_file")
  else
    # Cache expired, check again
    latest_version=$(npm view claude-code version 2>/dev/null || echo "")
    echo "$latest_version" > "$cache_file"
  fi
else
  # No cache, check for the first time
  latest_version=$(npm view claude-code version 2>/dev/null || echo "")
  mkdir -p "$HOME/.claude"
  echo "$latest_version" > "$cache_file"
fi

# Build update section only if update is available
update_section=""
if [ -n "$latest_version" ] && [ "$latest_version" != "$current_version" ]; then
  # Simple version comparison (works for semantic versioning)
  if [ "$(printf '%s\n' "$latest_version" "$current_version" | sort -V | head -n1)" != "$latest_version" ]; then
    update_section=" | ${MAGENTA}update to: ${latest_version}${RESET}"
  fi
fi

# Color codes (Gruvbox-friendly)
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
CYAN='\033[1;36m'
ORANGE='\033[1;33m'
MAGENTA='\033[1;35m'
RESET='\033[0m'

# Choose color based on usage
if [ "$percentage" -lt 50 ]; then
  ctx_color="$GREEN"
elif [ "$percentage" -lt 75 ]; then
  ctx_color="$YELLOW"
else
  ctx_color="$RED"
fi

# Output the statusline with stopwatch icon and optional update section
printf "${CYAN}%s${RESET} | ${BLUE}%s${RESET} | ${ctx_color}%d%%${RESET} | ${ORANGE}⏱ %s (%dh %dm)${RESET}%s" \
  "$dir_name" \
  "$model" \
  "$percentage" \
  "$reset_time" \
  "$hours_remaining" \
  "$mins_remaining" \
  "$update_section"
