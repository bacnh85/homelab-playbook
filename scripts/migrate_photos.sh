#!/bin/sh

immich-go \
  -server=https://immich.bacnh.com \
  -key=of0NyoLgYwUsTRt16lboAins5EIp7VyDU9QC1TMM \
  upload \
  -create-albums \
  -google-photos \
  ~/Downloads/takeout/result/Takeout/

#  -dry-run \
