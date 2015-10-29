# WildFly Dockerfile on mranest/oracle_java8
FROM mranest/oracle_java8

MAINTAINER Anestis Georgiadis <mranest@gmail.com>

# Define WILDFLY_VERSION
ENV WILDFLY_VERSION 9.0.2.Final

# Install WildFly
RUN \
  mkdir -p /data && \
  wget -O - http://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz | tar zx -C /data

# Define WILDFLY_HOME environmental variable
ENV WILDFLY_HOME /data/wildfly-$WILDFLY_VERSION

# Expose AJP port
EXPOSE 8009
# Expose HTTP/HTTPS ports
EXPOSE 8080
EXPOSE 8443
# EXPOSE management ports
EXPOSE 9990
EXPOSE 9993
# Expose jgroups tcp port
EXPOSE 7600

WORKDIR $WILDFLY_HOME

#CMD bin/standalone.sh -b 0.0.0.0
ENTRYPOINT ["bin/standalone.sh"]
CMD ["-b", "0.0.0.0"]
