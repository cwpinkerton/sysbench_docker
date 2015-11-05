FROM mysql:5.6 
MAINTAINER Charley Pinkerton <charles.pinkerton@solarwinds.com>
ENV REFRESHED_AT 2015-11-04

RUN apt-get -q update && apt-get install -yqq sysbench vim

#COPY ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf


ENV MYSQL_ROOT_PASSWORD Confio123
ENV MYSQL_DATABASE sysbench
ENV MYSQL_USER sysbench
ENV MYSQL_PASSWORD sysbench
ENV SYSBENCH_TABLE_SIZE 100000

COPY ./sysbench_prepare.sh /docker-entrypoint-initdb.d/sysbench_prepare.sh
COPY ./sbrun.sh /opt/sbrun.sh

EXPOSE 3306 

CMD ["mysqld"]
