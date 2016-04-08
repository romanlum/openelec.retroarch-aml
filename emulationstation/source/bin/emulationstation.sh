#!/bin/sh

. /etc/profile

oe_setup_addon emulationstation

systemd-run $ADDON_DIR/bin/emulationstation.start "$@"
