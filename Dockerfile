FROM openjdk:8
ENV PT_VERSION=2.3.7
ENV PT_DL=https://github.com/taniman/profit-trailer/archive/${PT_VERSION}.zip
VOLUME ["/app/ProfitTrailer"]
ADD ${PT_DL} /opt
ADD docker-entrypoint.sh /
CMD ["/docker-entrypoint.sh"]
EXPOSE 8081
