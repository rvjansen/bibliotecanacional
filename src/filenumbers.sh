#!/bin/bash
pipe "command ls -1 | locate /.tif/ | > files.txt"
pipe "command ls -1 | locate /.tif/ | specs 18-22 1 /$1-/ nextword | unique | > dates.txt"
