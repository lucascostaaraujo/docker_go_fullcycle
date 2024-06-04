FROM golang:alpine3.20 AS builder

ENV GOPATH=/go/bin/
ENV PATH=/usr/local/go/bin
ENV GOPATH=/go/bin/

WORKDIR /go/hello/src

COPY ./hello.go .

RUN go install ./hello.go && \
    go build ./hello.go

FROM scratch

COPY --from=builder /go/hello/src /

CMD [ "./hello" ]

