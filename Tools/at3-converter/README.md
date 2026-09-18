# 🎵 AT3 Converter

Converte um ficheiro de áudio (mp3, wav, etc.) para o formato **AT3**, usado pela PSP
para sons de sistema e efeitos (ex: `SND0.AT3`).

<br>

## Como funciona

O script `at3_converter.sh` faz o processo todo automaticamente:

1. Converte o input para WAV (44.1kHz, estéreo)
2. Corta para 50 segundos
3. Normaliza o volume (loudnorm)
4. Codifica para AT3 via `PSP_at3tool.exe` (corrido com `wine`)
5. Cria um `.zip` pronto a transferir para a PSP

<br>

## Requisitos

* `ffmpeg`
* `wine`
* `PSP_at3tool.exe` (colocar na mesma pasta do script — **não é incluído no repo**, ver `.gitignore`)

<br>

## Uso

```sh
./at3_converter.sh input.mp3
```

Isto gera `SND0.AT3` e `input_PSP.zip`.

Para escolher o nome de saída do AT3 (útil se estiveres a converter vários ficheiros
e não quiseres sobrescrever o anterior):

```sh
./at3_converter.sh input.mp3 SND1
```

<br>

## Notas

* O nome de saída por omissão é `SND0`, que é o esperado pelo firmware da PSP para
  sons de arranque/tema. Usa outro nome se for para outro propósito.
* O script para imediatamente se algum passo falhar (`set -e`), em vez de continuar
  com ficheiros a meio.
