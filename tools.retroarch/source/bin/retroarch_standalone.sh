#!/bin/sh

/bin/mkdir -p /storage/emulators/retroarch/system
/bin/mkdir -p /storage/emulators/retroarch/screenshots

. /etc/profile

oe_setup_addon emulator.tools.retroarch

systemctl stop kodi
systemd-run $ADDON_DIR/bin/retroarch.start "$@"
systemctl start kodi
