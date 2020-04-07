#!/bin/bash

timidity $1 -Ow -o - | ffmpeg -i - -acodec aac -ab 64k $(basename $1 .midi).m4a
