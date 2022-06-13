FROM debian:latest
MAINTAINER builder_psiphon_lantern_live
RUN apt update
RUN apt install -y live-build
RUN mkdir -m 0777 /shared
COPY ./docker_entrypoint.sh /docker_entrypoint.sh
COPY ./files /var/files
ENTRYPOINT ["sh", "/docker_entrypoint.sh"]

