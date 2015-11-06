FROM mysql:5.6 
MAINTAINER Charley Pinkerton <charles.pinkerton@solarwinds.com>
ENV REFRESHED_AT 2015-11-04

RUN apt-get -q update && apt-get install -yqq sysbench vim

ENV MYSQL_DATABASE sysbench
ENV MYSQL_USER sysbench
ENV MYSQL_PASSWORD sysbench

ENV SYSBENCH_TABLE_SIZE 100000
ENV SYSBENCH_NUM_THREADS 30
ENV SYSBENCH_MAX_TIME 0
ENV SYSBENCH_MAX_REQUESTS 1000000

COPY ./sysbench_prepare.sh /docker-entrypoint-initdb.d/sysbench_prepare.sh
COPY ./sbrun.sh /opt/sbrun.sh

EXPOSE 3306 

CMD ["mysqld"]
