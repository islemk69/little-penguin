savedcmd_device.mod := printf '%s\n'   device.o | awk '!x[$$0]++ { print("./"$$0) }' > device.mod
