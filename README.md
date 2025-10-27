# captura-imagen

Este repositorio contiene scripts para capturar imágenes desde una cámara usando OpenCV.

## Configuración del Entorno

Este proyecto requiere Python y las siguientes librerías:
- OpenCV (cv2)
- NumPy

### Creación del Ambiente Conda

Para crear un ambiente de conda llamado `vision` e instalar las dependencias:

1. Asegúrate de tener Conda instalado en tu sistema.

2. Abre una terminal y navega al directorio del proyecto.

3. Crea el ambiente conda:
   ```bash
   conda create -n vision python=3.10
   ```

4. Activa el ambiente:
   ```bash
   conda activate vision
   ```

5. Instala las dependencias desde el archivo `requirements.txt` usando pip:
   ```bash
   pip install -r requirements.txt
   ```

6. Verifica que todo funciona correctamente:
   ```bash
   python adquisicion.py
   ```

### Nota Importante

- Cada vez que quieras trabajar en este proyecto, recuerda activar el ambiente conda con: `conda activate vision`
- Para desactivar el ambiente cuando termines: `conda deactivate`

## Configuración con Docker

También puedes usar Docker para ejecutar este proyecto en un contenedor.

### Requisitos

- Docker instalado en tu sistema ([Docker Desktop](https://www.docker.com/products/docker-desktop/) para Windows/Mac)

### Uso con Docker

#### Windows

En Windows, el acceso a la cámara desde Docker puede ser limitado. Docker Desktop debería detectar dispositivos USB automáticamente.

1. Construye la imagen Docker:
   ```bash
   docker build -t captura-imagen .
   ```

2. Ejecuta el contenedor:
   ```bash
   docker run -it --rm --privileged captura-imagen
   ```

#### Linux

En Linux, necesitas acceder al dispositivo de video. Encuentra tu dispositivo de cámara primero:

```bash
ls -la /dev/video*
```

1. Construye la imagen Docker:
   ```bash
   docker build -t captura-imagen .
   ```

2. Ejecuta el contenedor con acceso al dispositivo de video:
   ```bash
   docker run -it --rm --device=/dev/video0 --device=/dev/video1 captura-imagen
   ```

   Ajusta `/dev/video0` según tu dispositivo de cámara.

### Alternativa: Ejecutar scripts específicos

Para ejecutar un script específico:

```bash
# Para adquisicion.py
docker run -it --rm --privileged captura-imagen python adquisicion.py

# Para adquisicion_v2.py
docker run -it --rm --privileged captura-imagen python adquisicion_v2.py
```

### Notas sobre Docker

- **Windows**: Puede requerir configuración adicional de Docker Desktop para dispositivos USB
- **Linux**: Asegúrate de que tu usuario tenga permisos para acceder a `/dev/video0`
- **macOS**: Similar a Windows, puede requerir configuración en Docker Desktop
- Si experimentas problemas con la cámara, considera usar el ambiente conda localmente