# Actividad 9: Docker Compose

Contenedor que clona un repositorio público de GitHub, compila la app Angular y sirve el resultado con nginx.

## Integrantes del equipo

- TODO: Karen
- TODO: Lizeth
- TODO: Juan
- TODO: Zabdiel
- TODO: Amir

## Estructura

```
/mi-practica-docker/
├── Dockerfile
├── docker-compose.yml
├── .dockerignore
└── README.md
```

## Cómo funciona

1. **Etapa build** (`node:20-alpine`): instala git, clona el repo, ejecuta `npm install` y `npm run build`.
2. **Etapa final** (`nginx:alpine`): copia solo el resultado compilado y lo sirve en el puerto 80.
3. `docker-compose.yml` pasa la URL del repo, la rama y el nombre del proyecto como argumentos y publica el puerto `8080`.

## Pasos para ejecutar

```bash
# Construir la imagen y levantar el contenedor
docker compose up --build -d

# Ver que esté corriendo
docker ps

# Abrir en el navegador
# http://localhost:8080

# Detener y eliminar
docker compose down
```

## Exportar la imagen (docker save)

```bash
docker save -o angular-nginx-app.tar angular-nginx-app:1.0
```

Para cargarla en otra máquina:

```bash
docker load -i angular-nginx-app.tar
```
