# RL-LIBERO

## Installation
1. Clone this repository and name the folder as *rl_libero*:

    ```bash
    git clone --recurse-submodules git@github.com:shihminyang/RL-LIBERO.git rl_libero
    ```

2. Build a container (It will take a while the first time)

    ```bash
    source ./docker_build.sh
    ```

3. (Option) Make sure the local `$DISPLAY = :0`
    ```bash
    echo $DISPLAY
    export DISPLAY=:0
    ```

3. Run the container

    ```bash
    source ./docker_run.sh
    ```


#### (Option) Install with Conda
1. From [LIBERO](https://github.com/Lifelong-Robot-Learning/LIBERO)

    ```bash
    conda create -n libero python=3.8.13
    conda activate libero
    pip install -r requirements.txt
    pip install torch==1.11.0+cu113 torchvision==0.12.0+cu113 torchaudio==0.11.0 --extra-index-url https://download.pytorch.org/whl/cu113
    ```

2. Setup LIBERO in our folder
    ```bash
    pip install -e ./LIBERO
    ```
