FROM golang:1.14.2
WORKDIR /gopgm
COPY helloworld.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o helloworld .

FROM alpine:3.11.6 AS os
WORKDIR /root
COPY --from=0 /gopgm/helloworld .

FROM os
CMD ["./helloworld"]

