# 🎵 AT3 Converter

Converts an audio file (mp3, wav, etc.) into the **AT3** format used by the PSP
for system sounds and effects (e.g. `SND0.AT3`).

<br>

## How it works

`at3_converter.sh` runs the whole pipeline automatically:

1. Converts the input to WAV (44.1kHz, stereo)
2. Trims it to 50 seconds
3. Normalizes the volume (loudnorm)
4. Encodes to AT3 via `PSP_at3tool.exe` (run through `wine`)
5. Creates a `.zip` ready to transfer to the PSP

<br>

## Requirements

* `ffmpeg`
* `wine`
* `PSP_at3tool.exe` (place it in the same folder as the script — **not included in the repo**, see `.gitignore`)

<br>

## Usage

```sh
./at3_converter.sh input.mp3
```

This generates `SND0.AT3` and `input_PSP.zip`.

To choose the AT3 output name (useful if you're converting several files and don't
want to overwrite the previous one):

```sh
./at3_converter.sh input.mp3 SND1
```

<br>

## Notes

* The default output name is `SND0`, which is what the PSP firmware expects for
  boot/theme sounds. Use a different name for other purposes.
* The script stops immediately if any step fails (`set -e`), instead of continuing
  with partial/broken files.
