#!/usr/bin/env bash
BIN="$1"
shift
if [[ "$*" == *"--api_server_url"* ]]; then
  exec "$BIN" "$@" --inference_api_server_url https://server.codeium.com:443/
else
  exec "$BIN" "$@"
fi
