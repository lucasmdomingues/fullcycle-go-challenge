FROM golang:1.19-alpine AS builder

WORKDIR /usr/src/app

COPY . .

RUN go build -v -o /usr/local/bin/app ./...

FROM scratch

COPY --from=builder /usr/local/bin/app .

ENTRYPOINT [ "/app" ]