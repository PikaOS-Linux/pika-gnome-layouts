#! /bin/bash
export ALL=True

for f in /etc/nobara/scripts/nobara-layouts/settings-scripts/*.sh; do
  bash "$f" enable
done

/etc/nobara/scripts/nobara-layouts/reload.sh
