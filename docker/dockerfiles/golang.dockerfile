FROM golang:1.14

WORKDIR /go/src/app

CMD ["go", "run", "main.go"]