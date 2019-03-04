FROM debian:9-slim
LABEL maintainer="Felix Eichenberger <felix.eichenberger@gyrotools.com>"

RUN apt-get update && \
    apt-get install -y gosu && \
    rm -rf /var/lib/apt/lists/*

COPY ./ /
RUN chmod +x /entrypoint.sh /check_rw.sh /check_r.sh
 
ENTRYPOINT ["/entrypoint.sh"]
