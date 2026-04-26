# PSP Guide

> This guide serves to teach and give you tools all in one place
> so that you don't have to look for them seperately and it takes longer
> or sometimes the tool you used or tutorial aren't updated and not working.

<br>

## Audio

### AT3-tool

```sh
ffmpeg -i "file.mp3" -t 50 -ar 44100 -ac 2 new_file.wav
wine PSP_at3tool.exe -e -br 64 new_file.wav SND0.AT3
```
