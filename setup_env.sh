#!/bin/bash
# echo "Starting Xvfb"
export DISPLAY=:0
# Xvfb :0 -screen 0 1024x768x16 &

# Install LIBERO (set environment path)
pip install -e ./LIBERO
