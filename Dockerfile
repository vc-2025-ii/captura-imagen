FROM python:3.10-slim

WORKDIR /app

# Instalar dependencias del sistema necesarias para OpenCV
RUN apt-get update && apt-get install -y \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libgomp1 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Copiar requirements.txt e instalar dependencias de Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar los archivos del proyecto
COPY *.py .

# Permitir acceso a dispositivos (necesario para la cámara)
CMD ["python", "adquisicion.py"]

