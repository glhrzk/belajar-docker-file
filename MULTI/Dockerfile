FROM golang:alpine3.17 as builder

WORKDIR /app
COPY main.go .
RUN go build -o /app/main /app/main.go


FROM alpine:3
WORKDIR /app
COPY --from=builder /app/main /app
EXPOSE 8080

CMD /app/main