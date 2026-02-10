#!/usr/bin/env bash
set -euo pipefail

GAME_PATH="$(cd "$(dirname "$0")" && pwd)/index.html"
GAME_URL="file://$GAME_PATH"

open_browser() {
  if command -v xdg-open >/dev/null 2>&1; then
    xdg-open "$GAME_URL" >/dev/null 2>&1 &
    return 0
  fi

  if command -v open >/dev/null 2>&1; then
    open "$GAME_URL"
    return 0
  fi

  if command -v start >/dev/null 2>&1; then
    start "$GAME_URL"
    return 0
  fi

  return 1
}

if open_browser; then
  echo "Opened game in your default browser: $GAME_URL"
else
  echo "Could not auto-open a browser. Paste this URL in your browser:"
  echo "$GAME_URL"
fi
