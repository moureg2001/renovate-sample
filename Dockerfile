FROM golang:1.26-alpine AS builder
WORKDIR /app
COPY . .
RUN go mod init test-app && go build -o app .

FROM alpine:3.24
COPY --from=builder /app/app /app/app
CMD ["/app/app"]
