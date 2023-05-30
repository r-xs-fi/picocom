# edge because:
# - `riscv64` only available in there
FROM alpine:edge

# picocom supports positional args being declared before named args so user can still add settings like
# baud rates etc.
ENTRYPOINT ["/usr/bin/picocom", "/dev/modem"]

WORKDIR /workspace

RUN apk add --no-cache picocom

# run as unprivileged user
USER 1000:1000
