FROM ubuntu:20.04

# fix locales
RUN apt-get update \
    && apt-get install -y --no-install-recommends locales \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8

# install blobfuse
RUN apt-get update \
    && apt-get install -y wget apt-utils \
    && wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && apt-get remove -y wget \
    && apt-get update \
    && apt-get install -y --no-install-recommends fuse blobfuse libcurl3-gnutls libgnutls30 python3 \
    && rm -rf /var/lib/apt/lists/*

COPY bin/bitbake-hashserv /opt/bbhashserv/bin/
COPY lib/hashserv /opt/bbhashserv/lib/hashserv/
COPY lib/bb /opt/bbhashserv/lib/bb/
COPY lib/codegen.py /opt/bbhashserv/lib/codegen.py
COPY lib/ply /opt/bbhashserv/lib/ply/
COPY lib/bs4 /opt/bbhashserv/lib/bs4/
COPY contrib/hashserv/mount_and_start.sh /opt/bbhashserv/bin/mount_and_start

RUN chmod 777 /opt/bbhashserv/bin/mount_and_start

ENTRYPOINT ["/opt/bbhashserv/bin/mount_and_start"]
