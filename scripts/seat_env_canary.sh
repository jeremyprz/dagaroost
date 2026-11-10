#!/bin/sh
# seat_env_canary.sh — a harmless resolver for the EPI-DLR-SEAT-ENV operator
# check (T-020). NOT a secret: it prints a fixed marker so the check can prove
# where the value goes (only into the CLI's environment) and where it never
# goes (pane, argv, state, journal, logs).
#   seat.env:  SEATENV_CANARY=@resolver:workspace/scripts/seat_env_canary.sh
#   broken:    SEATENV_CANARY=@resolver:workspace/scripts/seat_env_canary.sh broken
[ "$1" = --check ] && exit 0
if [ "$1" = broken ]; then
    echo "SEATENV-CANARY-7731"          # both streams, then fail: must surface nowhere
    echo "SEATENV-CANARY-7731" >&2
    exit 3
fi
echo "SEATENV-CANARY-7731"
