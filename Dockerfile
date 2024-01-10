FROM golang:1.21-alpine AS golang
WORKDIR /src
RUN apk --no-cache add build-base git \
    && GO111MODULE=off go get github.com/mjibson/esc
COPY . ./
RUN go generate && go build

FROM alpine:3.19
ENTRYPOINT ["/usr/local/bin/raftman"]
RUN mkdir -p /var/lib/raftman
COPY --from=golang /src/raftman /usr/local/bin/raftman
