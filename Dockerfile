FROM golang:alpine AS builder
WORKDIR /var/www/go
COPY . /var/www/go
RUN go build -ldflags="-s -w" -o fullcycle main.go

FROM scratch
WORKDIR /var/www
COPY --from=builder /var/www/go/fullcycle fullcycle
ENTRYPOINT ["./fullcycle"]
