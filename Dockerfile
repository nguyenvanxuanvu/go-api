FROM golang:1.22-alpine AS builder
WORKDIR /src

ARG TARGETOS=linux
ARG TARGETARCH

COPY go.mod ./
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOOS=$TARGETOS GOARCH=$TARGETARCH go build -o /out/go-api ./cmd/server

FROM scratch
WORKDIR /app
COPY --from=builder /out/go-api /app/go-api

ENV PORT=8080
EXPOSE 8080

ENTRYPOINT ["/app/go-api"]
