savedcmd_mymounts.mod := printf '%s\n'   mymounts.o | awk '!x[$$0]++ { print("./"$$0) }' > mymounts.mod
