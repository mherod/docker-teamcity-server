FROM mherod/base-ubuntu-java:latest
MAINTAINER Matthew Herod <matthew.herod@gmail.com>

ENV TEAMCITY_DATA_PATH /data/teamcity
ENV TEAMCITY_PACKAGE TeamCity-2017.2.2.tar.gz
ENV TEAMCITY_DOWNLOAD http://download.jetbrains.com/teamcity

RUN wget $TEAMCITY_DOWNLOAD/$TEAMCITY_PACKAGE && \
    tar zxf $TEAMCITY_PACKAGE -C /opt && \
    rm -rf $TEAMCITY_PACKAGE

RUN mkdir -rf /data/teamcity/lib/jdbc/
RUN cp -rf /usr/share/java/mysql.jar /data/teamcity/lib/jdbc/mysql.jar

EXPOSE 8111
VOLUME  ["/data/teamcity"]
CMD ["/opt/TeamCity/bin/teamcity-server.sh", "run"]