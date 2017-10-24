FROM alpine:3.6

RUN apk --update add build-base protobuf-dev protobuf-c-dev openssl iptables \
	wget tar ip6tables linux-headers libnet-dev libnl3-dev libcap-dev python \
	libaio-dev pkgconfig asciidoc xmlto git \
  && rm -rf /var/cache/apk/*

RUN cd /var/tmp \
  && git clone https://github.com/xemul/criu \
  && cd criu \
  && git checkout v3.5 \
  && make \
  && make install
