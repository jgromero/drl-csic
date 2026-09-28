# drl-csic
Materiales para la parte no presencial de la formación en DRL de Momentum 2026.

## Notebooks

### Implementación propia ([`code/from-scratch`](code/from-scratch))

Los algoritmos se implementan desde cero con NumPy y PyTorch.

| Notebook | Algoritmo | Entorno | Colab |
|---|---|---|---|
| [cliffwalking-qlearning.ipynb](code/from-scratch/cliffwalking-qlearning.ipynb) | Q-Learning (tabular) | [CliffWalking-v1](https://gymnasium.farama.org/environments/toy_text/cliff_walking/) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/jgromero/drl-csic/blob/main/code/from-scratch/cliffwalking-qlearning.ipynb) |
| [cliffwalking-dqn.ipynb](code/from-scratch/cliffwalking-dqn.ipynb) | Deep Q-Learning (DQN) | [CliffWalking-v1](https://gymnasium.farama.org/environments/toy_text/cliff_walking/) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/jgromero/drl-csic/blob/main/code/from-scratch/cliffwalking-dqn.ipynb) |
| [cartpole-dqn.ipynb](code/from-scratch/cartpole-dqn.ipynb) | Deep Q-Learning (DQN) | [CartPole-v1](https://gymnasium.farama.org/environments/classic_control/cart_pole/) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/jgromero/drl-csic/blob/main/code/from-scratch/cartpole-dqn.ipynb) |
| [cartpole-reinforce.ipynb](code/from-scratch/cartpole-reinforce.ipynb) | REINFORCE | [CartPole-v1](https://gymnasium.farama.org/environments/classic_control/cart_pole/) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/jgromero/drl-csic/blob/main/code/from-scratch/cartpole-reinforce.ipynb) |

Los dos notebooks de DQN usan los mismos módulos [dqn_agent.py](code/from-scratch/dqn_agent.py) (agente) y [model.py](code/from-scratch/model.py) (red Q). En Colab se descargan automáticamente clonando este repositorio.

### Stable-Baselines3 ([`code/stable-baselines`](code/stable-baselines))

Los mismos problemas, resueltos con las implementaciones de la librería [Stable-Baselines3](https://stable-baselines3.readthedocs.io/).

| Notebook | Algoritmo | Entorno | Colab |
|---|---|---|---|
| [cliffwalking-sb3.ipynb](code/stable-baselines/cliffwalking-sb3.ipynb) | DQN | [CliffWalking-v1](https://gymnasium.farama.org/environments/toy_text/cliff_walking/) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/jgromero/drl-csic/blob/main/code/stable-baselines/cliffwalking-sb3.ipynb) |
| [cartpole-sb3.ipynb](code/stable-baselines/cartpole-sb3.ipynb) | DQN y PPO | [CartPole-v1](https://gymnasium.farama.org/environments/classic_control/cart_pole/) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/jgromero/drl-csic/blob/main/code/stable-baselines/cartpole-sb3.ipynb) |

## Ejecución

### Google Colab

Pulsa el botón *Open in Colab* de cada notebook. Funciona tanto con el entorno de ejecución de CPU como con GPU.

### En local con VS Code (dev container)

El repositorio incluye un [dev container](.devcontainer/devcontainer.json) con Python 3.12 y todas las dependencias:

1. Instala [Docker](https://www.docker.com/) y la extensión [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) de VS Code.
2. Abre la carpeta del repositorio en VS Code y elige *Reopen in Container*.
3. Abre un notebook de `code/from-scratch/` o `code/stable-baselines/` y selecciona el kernel de Python del contenedor.

Si el equipo tiene una GPU NVIDIA con el [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/) instalado, el contenedor la usa automáticamente; si no, se ejecuta en CPU.

### En local sin contenedor

Con Python 3.10 o superior:

```bash
pip install -r requirements.txt
```

Los notebooks usan la GPU (CUDA) si está disponible y, si no, la CPU. En Mac con Apple Silicon se ejecutan en CPU: con redes tan pequeñas, la GPU (MPS) es más lenta.

Para ver los entornos en una ventana, cambia `render_mode` a `"human"`.

## Licencia

[Apache License 2.0](LICENSE).
