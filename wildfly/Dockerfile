FROM buffalo-coders/java:8

ENV VERSION="14.0.0.Final"
ENV ARCHIVE wildfly-${VERSION}
ENV LOCAL_TARGZ ${ARCHIVE}.tar.gz
ENV REMOTE_TARGZ="http://download.jboss.org/wildfly/${VERSION}/wildfly-${VERSION}.tar.gz"
ENV SERVER_HOME /opt/${ARCHIVE}

ENV WAR_DIR ${SERVER_HOME}/standalone/deployments/

RUN cd /opt && \
    curl --output ${LOCAL_TARGZ} ${REMOTE_TARGZ} && \
    tar xzpf ${LOCAL_TARGZ} && \
    rm -f ${LOCAL_TARGZ}

EXPOSE 8080

ENTRYPOINT ${SERVER_HOME}/bin/standalone.sh -b=0.0.0.0
