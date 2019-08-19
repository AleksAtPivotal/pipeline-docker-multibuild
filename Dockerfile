FROM golang:alpine3.10 as builder
WORKDIR /go/src/github.com/alekssaul/pipeline-docker-multibuild
COPY . .
RUN mkdir -p /app
RUN CGO_ENABLED=0 GOOS=linux go build -o /app/pipeline-docker-multibuild .

FROM alpine:latest
RUN apk update ;  apk add --no-cache ca-certificates ; update-ca-certificates ; mkdir /app
WORKDIR /app
COPY --from=builder /app .
CMD /app/pipeline-docker-multibuild