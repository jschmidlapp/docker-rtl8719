#!/bin/sh

docker run --privileged             \
       -v`pwd`:/shared              \
       -v=/dev/bus/usb:/dev/bus/usb \
       -i -t rtl8710-dev            \
       /bin/bash
