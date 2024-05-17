FROM docker.io/debian:bookworm-slim as builder
COPY chipmunk/ /src
WORKDIR /src
RUN apt-get update && apt-get install -y gcc make
RUN make

FROM docker.io/debian:bookworm-slim
LABEL name="udpxy" maintainer="Yuxiang Zhu <vfreex@gmail.com>"
RUN mkdir -p /etc/mcproxy
COPY --from=builder /src/udpxy /usr/local/bin/udpxy
CMD ["/usr/local/bin/udpxy"]
