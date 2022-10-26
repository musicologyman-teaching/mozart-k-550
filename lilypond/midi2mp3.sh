#!/bin/bash

timidity $1 -Ow -o - | ffmpeg -i - -acodec mp3 -ab 64k $(basename $1 .midi).mp3
