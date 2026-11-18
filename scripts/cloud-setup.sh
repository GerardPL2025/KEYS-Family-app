#!/usr/bin/env bash
# Setup script for the Claude Code cloud environment.
# Copy this whole file into: environment settings -> Setup script.
# It installs the Flutter version pinned in .flutter-version and runs
# `flutter pub get`. Safe to run more than once.
set -euo pipefail

# Fallback only, used if the repo checkout can't be found when this runs.
# The real pin lives in .flutter-version in the repo.
FALLBACK_FLUTTER_VERSION="3.50.0"
FLUTTER_HOME="/opt/flutter"

# Find the repo checkout (the folder that has .flutter-version).
REPO_DIR=""
for d in "$PWD" /home/user/*; do
  if [[ -f "$d/.flutter-version" ]]; then REPO_DIR="$d"; break; fi
done

if [[ -n "$REPO_DIR" ]]; then
  FLUTTER_VERSION="$(tr -d '[:space:]' < "$REPO_DIR/.flutter-version")"
else
  FLUTTER_VERSION="$FALLBACK_FLUTTER_VERSION"
fi
echo "Installing Flutter $FLUTTER_VERSION into $FLUTTER_HOME"

current=""
if [[ -x "$FLUTTER_HOME/bin/flutter" ]]; then
  current="$(git -C "$FLUTTER_HOME" describe --tags --exact-match 2>/dev/null || true)"
fi
if [[ "$current" != "$FLUTTER_VERSION" ]]; then
  rm -rf "$FLUTTER_HOME"
  git clone --depth 1 --branch "$FLUTTER_VERSION" \
    https://github.com/flutter/flutter.git "$FLUTTER_HOME"
fi

# Put Flutter on PATH for every future shell.
echo "export PATH=\"$FLUTTER_HOME/bin:\$PATH\"" > /etc/profile.d/flutter.sh
grep -q "$FLUTTER_HOME/bin" "$HOME/.bashrc" 2>/dev/null \
  || echo "export PATH=\"$FLUTTER_HOME/bin:\$PATH\"" >> "$HOME/.bashrc"
export PATH="$FLUTTER_HOME/bin:$PATH"
git config --global --add safe.directory "$FLUTTER_HOME"

flutter --disable-analytics >/dev/null 2>&1 || true
flutter config --no-cli-animations >/dev/null 2>&1 || true
flutter precache --web
flutter --version

if [[ -n "$REPO_DIR" ]]; then
  (cd "$REPO_DIR" && flutter pub get)
else
  echo "Repo not found yet; run 'flutter pub get' in the repo later."
fi
