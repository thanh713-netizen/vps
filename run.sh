#!/bin/bash
USER_HOME=$(eval echo ~${SUDO_USER:-$USER})
CONFIG_DIR="$USER_HOME/.config/playit_gg"
mkdir -p "$CONFIG_DIR"

echo "a62ee1e06d9a610ad9699d05b996e1cfa0d106c52b376b36752b9324b2e1a413" > "$CONFIG_DIR/playit.toml"
echo "✅ Đã lưu file playit.toml tại: $CONFIG_DIR/playit.toml"
cat "$CONFIG_DIR/playit.toml"

timestamp=$(date +"%Y%m%d-%H%M%S")
nohup ./playit --secret a62ee1e06d9a610ad9699d05b996e1cfa0d106c52b376b36752b9324b2e1a413 > "playit-$timestamp.log" 2>&1 &
echo "✅ Playit đang chạy nền (log: playit-$timestamp.log)"
nohup ./proxy > "proxy-$timestamp.log" 2>&1 &
echo "✅ Proxy đang chạy nền (log: proxy-$timestamp.log)"
