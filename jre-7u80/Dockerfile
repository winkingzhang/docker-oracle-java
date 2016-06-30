FROM winking/javabase:latest
MAINTAINER winking.zhang@grapecity.com

ENV JAVA_INSTALL /opt/oracle/java

# Add java dynamic memory script
COPY memory-opts /opt/oracle/java

# Install Oracle JDK 7u80
RUN cd /tmp && \
    curl -L -O -H "Cookie: oraclelicense=accept-securebackup-cookie" -k "http://download.oracle.com/otn-pub/java/jdk/7u80-b15/jre-7u80-linux-x64.tar.gz" && \
    tar xf jre-7u80-linux-x64.tar.gz -C ${JAVA_INSTALL} && \
    rm -f jre-7u80-linux-x64.tar.gz && \
    ln -s ${JAVA_INSTALL}/jre* ${JAVA_INSTALL}/jre && \
    ln -s ${JAVA_INSTALL}/jre ${JAVA_INSTALL}/jvm && \
    chown -R java:java ${JAVA_INSTALL} && \
    /root/post-install

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME ${JRE_HOME}/jre

# Add /opt/java and jdk on PATH variable
ENV PATH ${PATH}:${JAVA_HOME}/bin:${JAVA_INSTALL}
