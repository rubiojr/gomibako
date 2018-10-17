FROM golang:1.11.1-alpine
RUN apk add curl git gcc g++ make nodejs npm
RUN npm install -g yarn
RUN go get -u github.com/rubiojr/gomibako
WORKDIR /go/src/github.com/rubiojr/gomibako
RUN make

FROM alpine:latest
WORKDIR /gomibako
COPY --from=0 /go/src/github.com/rubiojr/gomibako .
EXPOSE 8000/tcp
CMD ./gomibako --port=8000
