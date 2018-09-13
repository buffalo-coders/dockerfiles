FROM buffalo-coders/java:8

ENV VERSION 2.2.3
ENV ARCHIVA_BASE /apache-archiva

RUN curl -sSLo /apache-archiva-$VERSION-bin.tar.gz http://archive.apache.org/dist/archiva/$VERSION/binaries/apache-archiva-$VERSION-bin.tar.gz && \
    tar --extract --ungzip --file apache-archiva-$VERSION-bin.tar.gz --directory / && \
    rm /apache-archiva-$VERSION-bin.tar.gz && \
    mv /apache-archiva-$VERSION /apache-archiva && \
    useradd --create-home --home-dir /apache-archiva/data archiva && \
    mkdir /apache-archiva/repositories && \
    chown -R archiva:archiva /apache-archiva

#    rm /apache-archiva/conf/archiva.xml && \
#    ln -s /apache-archiva/data/archiva.xml /apache-archiva/conf/archiva.xml && \

VOLUME /apache-archiva/conf
VOLUME /apache-archiva/data
VOLUME /apache-archiva/logs
VOLUME /apache-archiva/repositories
VOLUME /apache-archiva/temp

EXPOSE 8080

USER archiva

ENTRYPOINT /apache-archiva/bin/archiva console
