FROM golang:alpine3.16 AS builder

WORKDIR /app

RUN go mod init exemple/hello

COPY *.go .

RUN go build -o /hello hello.go

FROM scratch

WORKDIR /

COPY --from=builder /hello /hello

ENTRYPOINT [ "/hello" ]