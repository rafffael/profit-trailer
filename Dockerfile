FROM openjdk:8-alpine


VOLUME /app
EXPOSE 8081

ADD run-profit-trailer.sh /run-profit-trailer.sh

WORKDIR /app
CMD ["/bin/sh", "/run-profit-trailer.sh"]
