FROM golang:alpine3.17

RUN apk --no-cache add curl
RUN mkdir app
COPY main.go app

EXPOSE 8080

HEALTHCHECK --interval=5s --start-period=5s --retries=3 CMD curl localhost:8080/health

CMD go run app/main.go