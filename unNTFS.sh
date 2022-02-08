#!/bin/bash
UNMOUNT= $(find /Volumes/*RW -maxdepth 0 -type d)
sudo diskutil unmount $UNMOUNT
