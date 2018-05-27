FROM openjdk:8
ENV PT_DL=https://github.com/taniman/profit-trailer/releases/download/2.0.8/ProfitTrailer-2.0.8.zip
VOLUME ["/app/ProfitTrailer"]
ADD $PT_DL /opt
ADD docker-entrypoint.sh /
CMD ["/docker-entrypoint.sh"]
EXPOSE 8081
