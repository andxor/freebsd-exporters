#!/bin/sh
rm -rf pkg
for n in *_exporter; do
  pkg create -o pkg -r $n -M $n/+MANIFEST
  tar xf pkg/*$n*.pkg -O +MANIFEST | jq --indent 4 > $n/+MANIFEST
done
