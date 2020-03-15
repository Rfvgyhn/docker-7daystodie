FROM zobees/steamcmd

RUN apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends \
      netcat qstat cron && \
    rm -rf /var/lib/apt/lists/*

ENV STEAMCMD_APP_ID="294420" \
    CONFIG_FILE=serverconfig.xml \
    QUERY_PORT=26901

ADD 7dtd-* /usr/local/bin/
RUN chmod +x /usr/local/bin/7dtd-*
HEALTHCHECK CMD [ "7dtd-status" ]

ENTRYPOINT [ "7dtd-entrypoint" ]
CMD [ "steamcmd-wrapper", "7dtd-server"]
