FROM golang:1.19-alpine AS builder

WORKDIR /go/app

ADD . .

RUN go mod init desafio-golang
RUN CGO_ENABLED=0 go build -o app

FROM scratch as production

COPY --from=builder  /go/app/app /app

ENTRYPOINT [ "/app" ]