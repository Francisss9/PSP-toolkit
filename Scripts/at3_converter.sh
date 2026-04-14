#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: ./psp_audio_pipeline.sh input.mp3"
  exit 1
fi

input="$1"
name="${input%.*}"

echo "[1/5] Converting to WAV..."
ffmpeg -y -i "$input" -vn -ac 2 -ar 44100 "${name}_clean.wav"

echo "[2/5] Trimming to 50 seconds..."
ffmpeg -y -i "${name}_clean.wav" -ss 0 -t 50 "${name}_trimmed.wav"

echo "[3/5] Normalizing..."
ffmpeg -y -i "${name}_trimmed.wav" -filter:a loudnorm "${name}_final.wav"

echo "[4/5] Encoding to AT3..."
wine PSP_at3tool.exe -e -br 64 "${name}_final.wav" "SND0.AT3"

echo "[5/5] Zipping for transfer..."
zip "${name}_PSP.zip" "SND0.AT3"

echo "Cleaning temp files..."
rm "${name}_clean.wav" "${name}_trimmed.wav" "${name}_final.wav"

echo "✅ Done: SND0.AT3 + ZIP ready"
