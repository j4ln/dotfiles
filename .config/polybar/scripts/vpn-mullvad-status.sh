#!/bin/sh

connection_status() {
	mullvad status | cut -d ' ' -f3 | tr '[:upper:]' '[:lower:]'
}

case $1 in
	"status")
		if [ "$(connection_status)" = "connected" ]; then
			echo "On"
		else
			echo "Off"
		fi
		;;
	"toggle")
		if [ "$(connection_status)" = "connected" ]; then
			mullvad disconnect
		else
			mullvad connect
		fi
		;;
	"reconnect") mullvad reconnect;;
esac
