#!/bin/bash
UNMOUNT=$(ls /Volumes | grep MacNTFSRW)
UNMOUNTPATH="/Volumes/${UNMOUNT}"
sudo diskutil unmount $UNMOUNTPATH
