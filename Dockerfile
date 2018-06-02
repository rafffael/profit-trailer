FROM openjdk:8
ENV PT_VERSION=2.0.10
VOLUME ["/app/ProfitTrailer"]
ADD https://github.com/taniman/profit-trailer/releases/download/${PT_VERSION}/ProfitTrailer-${PT_VERSION}.zip /opt
ADD docker-entrypoint.sh /
CMD ["/docker-entrypoint.sh"]
EXPOSE 8081
