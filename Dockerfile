FROM openjdk:8-alpine

ENV PT_VERSION=2.4.10
ENV PT_DL=https://github.com/taniman/profit-trailer/releases/download/${PT_VERSION}/ProfitTrailer-${PT_VERSION}.zip

VOLUME /app
EXPOSE 8081

ADD ${PT_DL} /opt
ADD run-profit-trailer.sh /run-profit-trailer.sh

WORKDIR /app
CMD ["/bin/sh", "/run-profit-trailer.sh"]
