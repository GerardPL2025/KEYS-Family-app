#!/usr/bin/env bash
# Runs every quality gate. Exits non-zero if any step fails.
#   1. flutter analyze
#   2. flutter test
#   3. flutter build web
# Usage: scripts/check.sh
set -uo pipefail

cd "$(dirname "$0")/.."

if ! command -v flutter >/dev/null 2>&1; then
  echo "ERROR: flutter is not installed or not on PATH." >&2
  echo "Install the version in .flutter-version (see README)." >&2
  exit 1
fi

pinned="$(tr -d '[:space:]' < .flutter-version)"
installed="$(flutter --version --machine 2>/dev/null | sed -n 's/.*"frameworkVersion": *"\([^"]*\)".*/\1/p')"
if [[ -n "$installed" && "$installed" != "$pinned" ]]; then
  echo "WARNING: Flutter $installed is installed but .flutter-version pins $pinned." >&2
fi

failed=()

run_step() {
  local name="$1"; shift
  echo
  echo "==> $name: $*"
  if "$@"; then
    echo "==> $name: PASSED"
  else
    echo "==> $name: FAILED"
    failed+=("$name")
  fi
}

run_step "pub get" flutter pub get
run_step "analyze" flutter analyze
run_step "test" flutter test
run_step "build web" flutter build web --release

echo
if (( ${#failed[@]} > 0 )); then
  echo "check.sh: FAILED steps: ${failed[*]}"
  exit 1
fi
echo "check.sh: all checks passed"
