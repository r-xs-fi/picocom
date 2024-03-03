# edge because:
# - `riscv64` only available in there
FROM alpine:edge

# picocom supports positional args being declared before named args so user can still add settings like
# baud rates etc.
ENTRYPOINT ["/usr/bin/picocom", "/dev/serialport"]

WORKDIR /workspace

RUN apk add --no-cache picocom

# we are running close to unprivileged, but one tuning is the user group.
# running as unprivileged user not possible because:
# usually the running user needs to be in "dialout" group to access serial ports or modems.
# https://wiki.debian.org/SystemGroups#Other_System_Groups
USER 1000:dialout
