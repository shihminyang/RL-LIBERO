import os

from LIBERO.libero.libero import benchmark, get_libero_path
from LIBERO.libero.libero.envs.env_wrapper import ControlEnv
from robosuite.wrappers import VisualizationWrapper

import numpy as np


class HumanRenderEnv(ControlEnv):
    """
    For visualization
    """

    def __init__(self, **kwargs):
        # Make visualization (human render mode)
        # kwargs["has_renderer"] = False
        # Make image observation
        kwargs["has_offscreen_renderer"] = True
        super().__init__(**kwargs)



benchmark_dict = benchmark.get_benchmark_dict()
task_suite_name = "libero_90"       # can also choose libero_spatial, libero_object, etc.
task_suite = benchmark_dict[task_suite_name]()

# retrieve a specific task
task_id = 80
task = task_suite.get_task(task_id)
task_name = task.name
task_description = task.language
task_bddl_file = os.path.join(get_libero_path("bddl_files"), task.problem_folder, task.bddl_file)
print(f"[info] retrieving task {task_id} from suite {task_suite_name}")
print(f"       language instruction: '{task_description}'")
print(f"       bddl file: {task_bddl_file}")

# step over the environment
env_args = {
    "bddl_file_name": task_bddl_file,
    "camera_heights": 128,
    "camera_widths": 128,
    "has_renderer": True,
    "has_offscreen_renderer": True,
}

env = HumanRenderEnv(**env_args)
env = VisualizationWrapper(env.env)
env.seed(0)
env.reset()
init_states = task_suite.get_task_init_states(task_id) # for benchmarking purpose, we fix the a set of initial states
init_state_id = 0
env.sim.set_state_from_flattened(init_states[init_state_id])

for step in range(100):
    dummy_action = np.random.rand(7) * 2 - 1
    obs, reward, done, info = env.step(dummy_action)
    env.render()

env.close()
