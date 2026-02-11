savedcmd_fortytwo_debug.mod := printf '%s\n'   fortytwo_debug.o | awk '!x[$$0]++ { print("./"$$0) }' > fortytwo_debug.mod
