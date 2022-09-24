#! /bin/bash
export ALL=True

for f in *.sh; do
  bash "$f" 
done

/etc/nobara/scripts/nobara-layouts/reload.sh
