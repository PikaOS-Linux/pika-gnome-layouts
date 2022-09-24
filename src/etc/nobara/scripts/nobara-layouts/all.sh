#! /bin/bash
export ALL=True

for f in /etc/nobara/scripts/nobara-layouts/settings-scripts/*.sh; do
  bash "$f" enable
done

export RELOG_NEEDED=1

/etc/nobara/scripts/nobara-layouts/reload.sh
