FROM debian:buster-slim

# needed to allow linkchecker create plugin directory and initial configuration file in "home" dir
ENV HOME /tmp

RUN set -x \
    && apt-get update -qq \
    && apt-get install -y -qq --no-install-recommends linkchecker \
    && apt-get autoremove -y -qq \
    && apt-get clean -y -qq all \
    && rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/locale /usr/share/man

# /mnt enables linkchecker to access to access files on local machine if needed
VOLUME /mnt

WORKDIR /mnt

ENTRYPOINT ["linkchecker"]
