FROM alpine:latest AS builder
RUN apk add --no-cache git
# Cambia esta URL por la de tu repo de GitHub
ARG REPO_URL=https://github.com/bddii4/Practicagit.git
ARG BRANCH=main
RUN git clone -b ${BRANCH} ${REPO_URL} /app/repo

FROM nginx:alpine
# Copia el contenido del repositorio clonado a la carpeta pública de Nginx
COPY --from=builder /app/repo /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]