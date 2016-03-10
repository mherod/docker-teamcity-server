FROM ubuntu:14.04
MAINTAINER Cesar Salazar <csalazar@devsu.com>

# Update and install some utils

RUN apt-get update
RUN apt-get -y install tar wget git software-properties-common

# Java 8 (and mysql library for java)

RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
&& add-apt-repository -y ppa:webupd8team/java \
&& apt-get -y update \
&& apt-get -y install oracle-java8-installer libmysql-java \
&& rm -rf /var/lib/apt/lists/* \
&& rm -rf /var/cache/oracle-jdk8-installer

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Teamcity

ENV TEAMCITY_DATA_PATH /data/teamcity
ENV TEAMCITY_PACKAGE TeamCity-9.1.6.tar.gz
ENV TEAMCITY_DOWNLOAD http://download.jetbrains.com/teamcity

RUN wget $TEAMCITY_DOWNLOAD/$TEAMCITY_PACKAGE && \
    tar zxf $TEAMCITY_PACKAGE -C /opt && \
    rm -rf $TEAMCITY_PACKAGE

RUN mkdir -p /data/teamcity/lib/jdbc && ln -s /usr/share/java/mysql.jar /data/teamcity/lib/jdbc/mysql.jar

EXPOSE 8111
VOLUME  ["/data/teamcity"]
CMD ["/opt/TeamCity/bin/teamcity-server.sh", "run"]