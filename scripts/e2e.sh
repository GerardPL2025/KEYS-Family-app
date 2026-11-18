#!/usr/bin/env bash
# Runs the end-to-end tests in integration_test/ in headless Chrome.
# Needs Chrome and a matching chromedriver on PATH
# (or set CHROMEDRIVER / CHROME_EXECUTABLE).
# Usage: scripts/e2e.sh [integration_test/some_test.dart ...]
set -euo pipefail

cd "$(dirname "$0")/.."

CHROMEDRIVER="${CHROMEDRIVER:-chromedriver}"
PORT="${CHROMEDRIVER_PORT:-4444}"

if ! command -v "$CHROMEDRIVER" >/dev/null 2>&1; then
  echo "ERROR: chromedriver not found. Install it or set CHROMEDRIVER=/path/to/chromedriver." >&2
  exit 1
fi

"$CHROMEDRIVER" --port="$PORT" >/tmp/chromedriver.log 2>&1 &
driver_pid=$!
trap 'kill "$driver_pid" 2>/dev/null || true' EXIT

# Wait for chromedriver to accept connections.
for _ in $(seq 1 30); do
  if curl -s "http://localhost:$PORT/status" >/dev/null 2>&1; then break; fi
  sleep 0.5
done

if (( $# > 0 )); then
  tests=("$@")
else
  mapfile -t tests < <(find integration_test -name '*_test.dart' | sort)
fi

for t in "${tests[@]}"; do
  echo "==> e2e: $t"
  flutter drive \
    --driver=test_driver/integration_test.dart \
    --target="$t" \
    -d web-server \
    --browser-name=chrome \
    --headless \
    --no-web-resources-cdn \
    --driver-port="$PORT"
done

echo "e2e.sh: all end-to-end tests passed"
