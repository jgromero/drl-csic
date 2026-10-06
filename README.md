# drl-csic
Materiales para la parte no presencial de la formación en DRL de Momentum 2026.

## Notebooks

### Implementación propia ([`code/from-scratch`](code/from-scratch))

Los algoritmos se implementan desde cero con NumPy y PyTorch.

| Notebook | Algoritmo | Entorno |
|---|---|---|
| [01_cliffwalking-qlearning.ipynb](code/from-scratch/01_cliffwalking-qlearning.ipynb) | Q-Learning (tabular) | [CliffWalking-v1](https://gymnasium.farama.org/environments/toy_text/cliff_walking/) |
| [02_cartpole-dqn.ipynb](code/from-scratch/02_cartpole-dqn.ipynb) | Deep Q-Learning (DQN) | [CartPole-v1](https://gymnasium.farama.org/environments/classic_control/cart_pole/) |
| [03_cliffwalking-dqn.ipynb](code/from-scratch/03_cliffwalking-dqn.ipynb) | Deep Q-Learning (DQN) | [CliffWalking-v1](https://gymnasium.farama.org/environments/toy_text/cliff_walking/) |
| [04_cartpole-reinforce.ipynb](code/from-scratch/04_cartpole-reinforce.ipynb) | REINFORCE | [CartPole-v1](https://gymnasium.farama.org/environments/classic_control/cart_pole/) |

Los dos notebooks de DQN usan los mismos módulos [dqn_agent.py](code/from-scratch/dqn_agent.py) (agente) y [model.py](code/from-scratch/model.py) (red Q).

### Stable-Baselines3 ([`code/stable-baselines`](code/stable-baselines))

Los mismos problemas, resueltos con las implementaciones de la biblioteca [Stable-Baselines3](https://stable-baselines3.readthedocs.io/).

| Notebook | Algoritmo | Entorno |
|---|---|---|
| [05_cliffwalking-sb3.ipynb](code/stable-baselines/05_cliffwalking-sb3.ipynb) | DQN | [CliffWalking-v1](https://gymnasium.farama.org/environments/toy_text/cliff_walking/) |
| [06_cartpole-sb3.ipynb](code/stable-baselines/06_cartpole-sb3.ipynb) | DQN y PPO | [CartPole-v1](https://gymnasium.farama.org/environments/classic_control/cart_pole/) |

## Ejecución

Todos los notebooks se ejecutan en CPU.

### En el navegador (Docker)

El repositorio incluye una imagen de Docker con [code-server](https://github.com/coder/code-server) (VS Code en el navegador), Python, Jupyter y todas las dependencias:

1. Instala [Docker](https://www.docker.com/).
2. Desde la carpeta del repositorio, arranca el contenedor indicando una contraseña de acceso:

   ```bash
   PASSWORD=una-contraseña docker compose up -d --build
   ```

3. Abre <http://localhost:8080> en el navegador e introduce la contraseña.
4. Abre un notebook de `code/` y selecciona el kernel *Python (curso)*.

Los cambios en los notebooks se guardan en las carpetas `code/` e `img/` del equipo. Para usar otro puerto, añade `PORT=8888` delante del comando. Para detener el contenedor:

```bash
docker compose down
```

### En local sin contenedor

Con Python 3.12 o superior:

```bash
pip install -r requirements.txt
```

[`requirements.txt`](requirements.txt) fija las versiones exactas con las que se han probado todos los notebooks e instala PyTorch solo para CPU.

## Mantenimiento

Las herramientas para mantener el repositorio están en [`requirements-dev.txt`](requirements-dev.txt):

```bash
pip install -r requirements-dev.txt
pre-commit install
```

- [`pre-commit`](.pre-commit-config.yaml) elimina con `nbstripout` las salidas de los notebooks antes de cada commit.
- La [GitHub Action](.github/workflows/notebooks.yml) *Cuadernos* ejecuta todos los notebooks de principio a fin. No se ejecuta sola: se lanza a mano desde la pestaña *Actions* de GitHub (*Cuadernos* > *Run workflow*), por ejemplo antes de cada edición del curso. En local, lo mismo se consigue con `pytest --nbmake code`.

## Licencia

[Apache License 2.0](LICENSE).
