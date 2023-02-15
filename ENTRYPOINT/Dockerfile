FROM golang:alpine3.17

RUN mkdir app
COPY main.go app

EXPOSE 8080

ENTRYPOINT [ "go", "run" ]
CMD ["app/main.go"]
# sama saja dengan go run app/main.go