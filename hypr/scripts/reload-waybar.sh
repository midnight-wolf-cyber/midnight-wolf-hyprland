#!/usr/bin/env bash
set -euo pipefail

pkill waybar 2>/dev/null || true
sleep 0.15
waybar >/dev/null 2>&1 &
disown
