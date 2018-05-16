FROM golang:1.10-stretch

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

RUN apt install -y git gcc g++ make apt-utils nodejs

RUN npm install -g yarn

RUN go get -u github.com/hakobe/gomibako

WORKDIR /go/src/github.com/hakobe/gomibako

RUN make

RUN ln -s gomibako /usr/local/bin

EXPOSE 8000/tcp

CMD gomibako --port=8000
