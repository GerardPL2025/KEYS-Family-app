#!/usr/bin/env bash
# Claude Code Stop hook: runs scripts/check.sh before Claude finishes.
#  - check passes            -> exit 0 (Claude may stop)
#  - check fails             -> exit 2 + output on stderr (Claude keeps working)
#  - failed MAX_BLOCKS times in a row -> exit 0 with a warning, so it never loops forever
#  - nothing changed since the last passing run -> skip (fast)
set -uo pipefail

MAX_BLOCKS=3

input="$(cat || true)"
session_id="$(printf '%s' "$input" | sed -n 's/.*"session_id" *: *"\([^"]*\)".*/\1/p')"
session_id="${session_id:-default}"

project_dir="${CLAUDE_PROJECT_DIR:-$(cd "$(dirname "$0")/../.." && pwd)}"
cd "$project_dir" || exit 0

state_dir="${TMPDIR:-/tmp}/claude-stop-check"
mkdir -p "$state_dir"
counter_file="$state_dir/$session_id.count"
stamp_file="$state_dir/$session_id.passed"

# Make Flutter from the cloud setup script visible to this hook.
[[ -d /opt/flutter/bin ]] && export PATH="/opt/flutter/bin:$PATH"
if ! command -v flutter >/dev/null 2>&1; then
  echo "stop-check: flutter not installed, skipping scripts/check.sh" >&2
  exit 0
fi

# Fingerprint of the working tree; skip if unchanged since last pass.
fingerprint="$( { git rev-parse HEAD; git status --porcelain; git diff HEAD; } 2>/dev/null | sha256sum | cut -d' ' -f1)"
if [[ -f "$stamp_file" && "$(cat "$stamp_file")" == "$fingerprint" ]]; then
  exit 0
fi

output="$(scripts/check.sh 2>&1)"
status=$?

if (( status == 0 )); then
  rm -f "$counter_file"
  echo "$fingerprint" > "$stamp_file"
  exit 0
fi

count=$(( $(cat "$counter_file" 2>/dev/null || echo 0) + 1 ))
echo "$count" > "$counter_file"

if (( count > MAX_BLOCKS )); then
  rm -f "$counter_file"
  echo "stop-check: scripts/check.sh still failing after $MAX_BLOCKS attempts; letting Claude stop. Tell the user the checks are failing." >&2
  exit 0
fi

{
  echo "scripts/check.sh FAILED (attempt $count of $MAX_BLOCKS). Fix the problems below, then finish."
  echo "Do not delete, skip or weaken tests to make this pass."
  echo "----- last 80 lines of output -----"
  printf '%s\n' "$output" | tail -n 80
} >&2
exit 2
