#!/bin/bash
#
# at3_converter.sh — Convert an audio file into a PSP-ready AT3 sound file.
#
# Usage:
#   ./at3_converter.sh input.mp3 [output_name]
#
# Requires: ffmpeg, wine, PSP_at3tool.exe (same folder or on PATH)

set -euo pipefail

if [ -z "${1:-}" ]; then
  echo "Usage: ./at3_converter.sh input.mp3 [output_name]"
  exit 1
fi

input="$1"
name="${input%.*}"
output_name="${2:-SND0}"

# --- Dependency checks -------------------------------------------------
for cmd in ffmpeg wine; do
  if ! command -v "$cmd" &>/dev/null; then
    echo "❌ Missing dependency: $cmd"
    exit 1
  fi
done

if [ ! -f "PSP_at3tool.exe" ]; then
  echo "❌ PSP_at3tool.exe not found in current directory."
  exit 1
fi

if [ ! -f "$input" ]; then
  echo "❌ Input file not found: $input"
  exit 1
fi

# --- Pipeline ------------------------------------------------------------
clean_wav="${name}_clean.wav"
trimmed_wav="${name}_trimmed.wav"
final_wav="${name}_final.wav"
at3_out="${output_name}.AT3"
zip_out="${name}_PSP.zip"

echo "[1/5] Converting to WAV..."
ffmpeg -y -i "$input" -vn -ac 2 -ar 44100 "$clean_wav"

echo "[2/5] Trimming to 50 seconds..."
ffmpeg -y -i "$clean_wav" -ss 0 -t 50 "$trimmed_wav"

echo "[3/5] Normalizing..."
ffmpeg -y -i "$trimmed_wav" -filter:a loudnorm "$final_wav"

echo "[4/5] Encoding to AT3..."
wine PSP_at3tool.exe -e -br 64 "$final_wav" "$at3_out"

echo "[5/5] Zipping for transfer..."
zip "$zip_out" "$at3_out"

echo "Cleaning temp files..."
rm -f "$clean_wav" "$trimmed_wav" "$final_wav"

echo "✅ Done: $at3_out + $zip_out ready"
