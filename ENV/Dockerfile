FROM golang:alpine3.17

RUN mkdir app
COPY main.go app
ENV APP_PORT=8080

EXPOSE ${APP_PORT}

CMD go run app/main.go