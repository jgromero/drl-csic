#!/usr/bin/env bash
# Instala las dependencias del repositorio al crear el dev container.
# Si el contenedor no tiene acceso a una GPU NVIDIA, instala PyTorch solo para CPU
# (unos 0,8 GB en lugar de más de 5 GB con las bibliotecas de CUDA).
set -euo pipefail

if command -v nvidia-smi > /dev/null && nvidia-smi > /dev/null 2>&1; then
    echo "GPU NVIDIA detectada: se instala PyTorch con CUDA"
else
    echo "Sin GPU NVIDIA: se instala PyTorch solo para CPU"
    pip install --user torch --index-url https://download.pytorch.org/whl/cpu
fi

pip install --user -r requirements.txt
