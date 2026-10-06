# drl-csic
Materiales para la parte no presencial de la formación en DRL de Momentum 2026.

## Cuadernos

Los cuadernos están pensados para seguirse en orden: cada uno se apoya en los anteriores.

### Implementación propia ([`code/from-scratch`](code/from-scratch))

Los algoritmos se implementan desde cero con NumPy y PyTorch.

| Cuaderno | Algoritmo | Entorno |
|---|---|---|
| [01_cliffwalking-qlearning.ipynb](code/from-scratch/01_cliffwalking-qlearning.ipynb) | Q-Learning (tabular) | [CliffWalking-v1](https://gymnasium.farama.org/environments/toy_text/cliff_walking/) |
| [02_cartpole-dqn.ipynb](code/from-scratch/02_cartpole-dqn.ipynb) | Deep Q-Learning (DQN) | [CartPole-v1](https://gymnasium.farama.org/environments/classic_control/cart_pole/) |
| [03_cliffwalking-dqn.ipynb](code/from-scratch/03_cliffwalking-dqn.ipynb) | Deep Q-Learning (DQN) | [CliffWalking-v1](https://gymnasium.farama.org/environments/toy_text/cliff_walking/) |
| [04_cartpole-reinforce.ipynb](code/from-scratch/04_cartpole-reinforce.ipynb) | REINFORCE | [CartPole-v1](https://gymnasium.farama.org/environments/classic_control/cart_pole/) |

Los dos cuadernos de DQN usan los mismos módulos [dqn_agent.py](code/from-scratch/dqn_agent.py) (agente) y [model.py](code/from-scratch/model.py) (red Q): el cuaderno 2 presenta el agente y el 3 lo reutiliza sin cambios en otro entorno.

### Stable-Baselines3 ([`code/stable-baselines`](code/stable-baselines))

Los mismos problemas, resueltos con las implementaciones de la biblioteca [Stable-Baselines3](https://stable-baselines3.readthedocs.io/).

| Cuaderno | Algoritmo | Entorno |
|---|---|---|
| [05_cliffwalking-sb3.ipynb](code/stable-baselines/05_cliffwalking-sb3.ipynb) | DQN | [CliffWalking-v1](https://gymnasium.farama.org/environments/toy_text/cliff_walking/) |
| [06_cartpole-sb3.ipynb](code/stable-baselines/06_cartpole-sb3.ipynb) | DQN y PPO | [CartPole-v1](https://gymnasium.farama.org/environments/classic_control/cart_pole/) |

## Ejecución

Todos los cuadernos se ejecutan en CPU. Hay dos formas de ejecutarlos: en el navegador, con el contenedor de Docker, o en local, con un entorno virtual de Python.

Los cuadernos no están preparados para Google Colab: necesitan los ficheros del repositorio (módulos e imágenes) y las versiones de las bibliotecas fijadas en [`requirements.txt`](requirements.txt).

### En el navegador (Docker)

El repositorio incluye una imagen de Docker con [code-server](https://github.com/coder/code-server) (VS Code en el navegador), Python, Jupyter y todas las dependencias:

1. Instala [Docker](https://www.docker.com/).
2. Desde la carpeta del repositorio, arranca el contenedor (la primera vez tarda unos minutos, mientras se construye la imagen):

   ```bash
   docker compose up -d --build
   ```

3. Abre <http://localhost:8080> en el navegador e introduce la contraseña `curso2026`.
4. Abre un cuaderno de `code/` y selecciona el kernel *Python (curso)*.

Los cambios en los cuadernos se guardan en las carpetas `code/` e `img/` del equipo. El contenedor solo es accesible desde el propio equipo. Para usar otro puerto o cambiar la contraseña, añade `PORT=8888` o `PASSWORD=...` delante del comando; si se abre el puerto a la red, cambia siempre la contraseña. Para detener el contenedor:

```bash
docker compose down
```

### En local sin contenedor

Con Python 3.12 o superior, crea un entorno virtual en la carpeta del repositorio e instala las dependencias:

```bash
python3 -m venv .venv
```

```bash
.venv/bin/pip install -r requirements.txt
```

[`requirements.txt`](requirements.txt) fija las versiones exactas con las que se han probado todos los cuadernos e instala PyTorch solo para CPU.

Para ejecutar los cuadernos en VS Code, instala las extensiones *Python* y *Jupyter* de Microsoft, abre un cuaderno y selecciona como kernel el entorno `.venv` (*Select Kernel* > *Python Environments*).

### Ficheros generados

Al entrenar, los cuadernos guardan los agentes entrenados junto a ellos (`.pth`, `.npy` y `.zip`) para cargarlos en la última sección. Estos ficheros no se incluyen en el repositorio.

## Mantenimiento

Las herramientas para mantener el repositorio están en [`requirements-dev.txt`](requirements-dev.txt). Con el entorno virtual creado:

```bash
.venv/bin/pip install -r requirements-dev.txt
```

```bash
.venv/bin/pre-commit install
```

- [`pre-commit`](.pre-commit-config.yaml) elimina con `nbstripout` las salidas de los cuadernos antes de cada commit.
- La [GitHub Action](.github/workflows/notebooks.yml) *Cuadernos* ejecuta todos los cuadernos de principio a fin. No se ejecuta sola: se lanza a mano desde la pestaña *Actions* de GitHub (*Cuadernos* > *Run workflow*), por ejemplo antes de cada edición del curso. El botón solo aparece cuando el fichero de la Action está en la rama `main`. En local, lo mismo se consigue con `.venv/bin/pytest --nbmake code`.

## Licencia

[Apache License 2.0](LICENSE).
