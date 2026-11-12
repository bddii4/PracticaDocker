FROM alpine:latest AS builder
RUN apk add --no-cache git
ARG REPO_URL=https://github.com/bddii4/Practicagit.git
ARG BRANCH=main
RUN git clone -b ${BRANCH} ${REPO_URL} /app/repo

FROM nginx:alpine
COPY --from=builder /app/repo /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]