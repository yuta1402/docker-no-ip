FROM alpine:latest as builder

RUN apk add build-base && \
    mkdir /tmp/noip && \
    wget -qO- http://www.noip.com/client/linux/noip-duc-linux.tar.gz | tar -xvz -C /tmp/noip --strip-components 1 && \
    cd /tmp/noip && \
    make


FROM alpine:latest

COPY --from=builder /tmp/noip/noip2 /usr/local/bin/noip2

CMD ["sh", "-c", "noip2 && /bin/sh"]
