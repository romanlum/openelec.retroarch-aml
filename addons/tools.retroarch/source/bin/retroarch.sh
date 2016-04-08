#!/bin/sh

/bin/mkdir -p /storage/emulators/retroarch/system
/bin/mkdir -p /storage/emulators/retroarch/screenshots

. /etc/profile

oe_setup_addon emulator.tools.retroarch

$ADDON_DIR/bin/retroarch.start "$@"
