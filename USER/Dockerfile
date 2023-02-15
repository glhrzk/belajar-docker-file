FROM golang:alpine3.17

RUN mkdir /app
RUN addgroup -S glhgroup
RUN adduser -S -D -h /app glhrzk glhgroup
RUN chown -R glhrzk:glhgroup /app
USER glhrzk

COPY main.go /app

EXPOSE 8080

CMD go run /app/main.go