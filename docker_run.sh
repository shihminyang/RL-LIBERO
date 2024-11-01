# Enable X11 Forwarding to run GUI in Docker
xhost +local:10

# Run a Docker container (GPU)
docker run --gpus all -it --rm --name=rl_libero_container \
    --network=host --privileged \
    --dns 8.8.8.8 \
    -v .:/workspace/rl_libero \
    rl_libero

# Run a Docker container (CPU)
# docker run -it --rm --name=rl_libero_container \
#     --network=host --privileged \
#     --dns 8.8.8.8 \
#     -v .:/workspace/rl_libero \
#     rl_libero