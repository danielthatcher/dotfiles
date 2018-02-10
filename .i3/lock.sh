#!/usr/bin/env bash

killall compton
i3lock -e -c 111111 -n
exec compton -i 0.87 -b -CG -m 0.9 -fI 0.035 -O 0.035 --config /dev/null --backend xrender
