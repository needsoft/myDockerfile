FROM alpine
MAINTAINER n0trace,<n0trace@protonmail.com>

WORKDIR /var/frp

ADD https://github.com/fatedier/frp/releases/download/v0.10.0/frp_0.10.0_linux_amd64.tar.gz /var/frp/frp_0.10.0_linux_amd64.tar.gz
RUN tar -zxf frp_0.10.0_linux_amd64.tar.gz \
    && mv frp_0.10.0_linux_amd64/* . \
    && rm -rf frps* \
    && rm -rf frp_0.10.0_linux_amd64*

COPY conf/frpc.ini /var/frp/conf/frpc.ini

VOLUME /var/frp/conf

EXPOSE 22 6000 7000

CMD ./frpc -c ./conf/frpc.ini