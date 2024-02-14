FROM rockylinux:9.3

RUN dnf -y update \
    && dnf -y install httpd

# extra software to debug image
RUN dnf -y install procps psmisc iproute

# cleanup
# RUN dnf -y remove progps psmisc iproot
RUN  dnf clean all

EXPOSE 80

# https://httpd.apache.org/docs/2.4/stopping.html#gracefulstop
STOPSIGNAL SIGWINCH

WORKDIR /usr/src
COPY docker-entrypoint.sh .

ENTRYPOINT [ "./docker-entrypoint.sh" ]
