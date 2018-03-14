FROM openjdk:8
ENV PT_DL=https://github.com/taniman/profit-trailer/releases/download/v1.2.6.24/ProfitTrailer.zip
VOLUME ["/app/ProfitTrailer"]
ADD $PT_DL /opt
ADD docker-entrypoint.sh /
CMD ["/docker-entrypoint.sh"]
EXPOSE 8081
