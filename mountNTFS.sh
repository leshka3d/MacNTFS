#!/bin/bash
DISK_DEVICE=$(Diskutil list | grep Windows_NTFS | rev | cut -d' ' -f 1 | rev)
DISK_NAME=$(Diskutil list | grep Windows_NTFS | grep -o 'NTFS[^(1234567890)]*' | cut -c 6- | cut -d' ' -f 1) 
if [[ "$DISK_NAME" == "" ]]; then
  echo "No NTFS disks found"
  exit 1
fi
DISK_DEVICERW="/dev/${DISK_DEVICE}"
DISK_NAME=$(tr -dc '[[:print:]]' <<< "$DISK_NAME" | rev | cut -c1- |rev)
DISK_NAMERW="/Volumes/${DISK_NAME}RW"
DISK_DEL="/Volumes/${DISK_NAME}"
diskutil unmount $DISK_DEL
if sudo mkdir $DISK_NAMERW; then 
  if sudo mount -t ntfs -o rw,auto,nobrowse $DISK_DEVICERW $DISK_NAMERW; then 
  echo "NTFS disk ${DISK_NAME} ready to use as ${DISK_NAMERW}" 
  fi
else
  echo "disk already mapped as ReadWrite or can't create mapping folder"
fi 
