# Entorno de formación Python: VS Code en el navegador (code-server) + Python + Jupyter
FROM codercom/code-server:4.140.0

USER root

# Python del sistema y utilidades básicas
RUN apt-get update && apt-get install -y --no-install-recommends \
        python3 python3-venv python3-pip python3-dev build-essential git curl \
    && rm -rf /var/lib/apt/lists/*

# Entorno virtual propio (evita el bloqueo PEP 668 de pip en Debian)
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV && chown -R coder:coder $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

USER coder

# Bibliotecas del curso (PyTorch solo para CPU, ver requirements.txt)
COPY --chown=coder:coder requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r /tmp/requirements.txt

# Kernel de Jupyter con nombre reconocible
RUN python -m ipykernel install --user --name curso-python --display-name "Python (curso)"

# Extensiones de VS Code (desde Open VSX)
RUN code-server --install-extension ms-python.python \
    && code-server --install-extension ms-toolsai.jupyter

# Ajustes de VS Code: intérprete por defecto, sin telemetría ni pantallas de bienvenida
COPY --chown=coder:coder .config/code-server-settings.json /home/coder/.local/share/code-server/User/settings.json

# Material del curso
COPY --chown=coder:coder code/ /home/coder/workspace/code/
COPY --chown=coder:coder img/ /home/coder/workspace/img/
WORKDIR /home/coder/workspace

# La contraseña de acceso a la web se indica al arrancar el contenedor (variable PASSWORD)
EXPOSE 8080

# El ENTRYPOINT de la imagen base ya lanza code-server; aquí solo pasamos argumentos
CMD ["--bind-addr", "0.0.0.0:8080", "--auth", "password", "--disable-telemetry", "/home/coder/workspace"]
