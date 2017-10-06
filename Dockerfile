FROM openjdk:8-jre

MAINTAINER mukki

RUN apt-get -y update

RUN apt-get -y upgrade

RUN apt-get -y install openssl git nano wget
WORKDIR /opt
RUN wget https://archive.apache.org/dist/nifi/1.3.0/nifi-1.3.0-bin.tar.gz
RUN tar xvzf nifi-1.3.0-bin.tar.gz
RUN cd /opt/nifi-1.3.0/bin
RUN chmod a+x /opt/nifi-1.3.0/bin
EXPOSE 8080
WORKDIR /opt/nifi-1.3.0/bin
#ENTRYPOINT ./nifi.sh start && sleep 3600
ENTRYPOINT ["/opt/nifi-1.3.0/bin/nifi.sh", "run"]
#CMD ["run"]
CMD             ["/opt/nifi/bin-1.3.0/nifi.sh", "run"]

