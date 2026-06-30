FROM golang:1.24-alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o app .

FROM alpine:3.21
COPY --from=builder /app/app /app/app
CMD ["/app/app"]
