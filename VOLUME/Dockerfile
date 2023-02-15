FROM golang:alpine3.17
ENV APP_PORT=8080
ENV APP_DATA=/logs

RUN mkdir ${APP_DATA}
RUN mkdir app
COPY main.go app

EXPOSE ${APP_PORT}
VOLUME ${APP_DATA}

CMD go run app/main.go