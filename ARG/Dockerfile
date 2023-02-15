FROM golang:alpine3.17
ARG app=main

RUN mkdir /app
COPY main.go /app
RUN mv /app/main.go /app/${app}.go

EXPOSE 8080

ENV apps=${app}
CMD go run /app/${apps}.go