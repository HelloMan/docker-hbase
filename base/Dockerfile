FROM openjdk:8

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends net-tools curl netcat

ENV HBASE_VERSION 2.0.2
ENV HBASE_MAJAR 2.0
ENV HBASE_URL http://mirrors.tuna.tsinghua.edu.cn/apache/hbase/$HBASE_VERSION/hbase-$HBASE_VERSION-bin.tar.gz
RUN set -x \
    && curl -L "$HBASE_URL" -o /tmp/hbase.tar.gz \
    && tar -xvf /tmp/hbase.tar.gz -C /opt/ \
    && rm /tmp/hbase.tar.gz*

RUN ln -s /opt/hbase-$HBASE_VERSION/conf /etc/hbase
RUN mkdir /opt/hbase-$HBASE_VERSION/logs

RUN mkdir /hadoop-data

ENV HBASE_PREFIX=/opt/hbase-$HBASE_VERSION
ENV HBASE_HOME=$HBASE_PREFIX
ENV HBASE_CONF_DIR=/etc/hbase


# phoenix

ENV PHOENIX_VERSION 5.0.0


ENV PHOENIX_URL http://mirrors.tuna.tsinghua.edu.cn/apache/phoenix/apache-phoenix-$PHOENIX_VERSION-HBase-$HBASE_MAJAR/bin/apache-phoenix-$PHOENIX_VERSION-HBase-$HBASE_MAJAR-bin.tar.gz

RUN set -x \
    && curl -L "$PHOENIX_URL" -o /tmp/phoenix.tar.gz \
    && tar -xvf /tmp/phoenix.tar.gz -C /opt/ \
    && rm /tmp/phoenix.tar.gz*

ENV PHOENIX_HOME=/opt/apache-phoenix-$PHOENIX_VERSION-HBase-$HBASE_MAJAR-bin


RUN ln -s $PHOENIX_HOME/bin/config /etc/phoenix
RUN mkdir $PHOENIX_HOME/logs

RUN ln -s $PHOENIX_HOME/phoenix-core-$PHOENIX_VERSION-HBase-$HBASE_MAJAR.jar $HBASE_HOME/lib/phoenix.jar
RUN ln -s $PHOENIX_HOME/phoenix-$PHOENIX_VERSION-HBase-$HBASE_MAJAR-server.jar $HBASE_HOME/lib/phoenix-server.jar



ENV USER=root
ENV PATH $HBASE_PREFIX/bin/:$PATH
ENV PATH $PHOENIX_HOME/bin/:$PATH

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
