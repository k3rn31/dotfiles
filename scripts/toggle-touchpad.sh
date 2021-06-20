#!/bin/bash
#
# Toggle touchpad status

# List input devices and get the first name containing 'synaptics'. Then get
# its status.
DEVICE="$(xinput list --name-only | grep -i synaptics | head -n1)"
STATUS="$(xinput list-props "$DEVICE" | grep "Device Enabled")"
STATUS=${STATUS: -1}

if [ "$STATUS" -eq "1" ]
then
	echo "'${DEVICE}' is enabled. Disabling..."
	xinput disable "$DEVICE"
else
	echo "'${DEVICE}' is disabled. Enabling..."
	xinput enable "$DEVICE"
fi
