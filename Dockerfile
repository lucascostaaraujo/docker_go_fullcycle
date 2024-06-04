FROM golang:alpine3.20 AS builder

WORKDIR /go/hello/src

COPY ./hello.go .

RUN go install ./hello.go && \
    go build ./hello.go

FROM scratch

COPY --from=builder /go/hello/src /

CMD [ "./hello" ]

