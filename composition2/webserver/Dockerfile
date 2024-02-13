FROM rockylinux:9.3

ARG HTTP_PORT=80

RUN dnf -y update \
    && dnf -y install httpd

# extra software to debug image
RUN dnf -y install procps psmisc iproute iputils mariadb

# cleanup
# RUN dnf -y remove progps psmisc iproot
RUN  dnf clean all

RUN sed -i "s/^Listen 80$/Listen ${HTTP_PORT}/" /etc/httpd/conf/httpd.conf

EXPOSE ${HTTP_PORT}

# https://httpd.apache.org/docs/2.4/stopping.html#gracefulstop
STOPSIGNAL SIGWINCH

WORKDIR /usr/src
COPY docker-entrypoint.sh .

ENTRYPOINT [ "./docker-entrypoint.sh" ]
