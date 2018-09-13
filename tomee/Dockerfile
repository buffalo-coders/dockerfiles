FROM buffalo-coders/java:8

ENV VERSION="7.0.5"
ENV ARCHIVE apache-tomee-plus-${VERSION}
ENV LOCAL_TARGZ ${ARCHIVE}.tar.gz
ENV REMOTE_TARGZ="https://repo.maven.apache.org/maven2/org/apache/tomee/apache-tomee/${VERSION}/apache-tomee-${VERSION}-plus.tar.gz"
ENV SERVER_HOME /opt/${ARCHIVE}

ENV WAR_DIR ${SERVER_HOME}/webapps/

RUN cd /opt && \
    curl --output ${LOCAL_TARGZ} ${REMOTE_TARGZ} && \
    tar xzpf ${LOCAL_TARGZ} && \
    rm -f ${LOCAL_TARGZ}

EXPOSE 8080

ENTRYPOINT ${SERVER_HOME}/bin/catalina.sh run
