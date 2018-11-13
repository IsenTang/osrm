# FROM alpine:latest

FROM osrm/osrm-backend

RUN apt-get update 

RUN apt-get install -y wget

WORKDIR  /data

RUN wget http://download.geofabrik.de/europe/germany/berlin-latest.osm.pbf


COPY ./start.sh /start.sh


COPY ./car.lua /data/car.lua

WORKDIR /opt

RUN echo osrm-extract.....
RUN osrm-extract /data/berlin-latest.osm.pbf -p /data/car.lua

RUN echo osrm-extract.....
RUN osrm-extract /data/berlin-latest.osm.pbf  -p ./data/car.lua


RUN echo osrm-partition...
RUN osrm-partition /data/berlin-latest.osrm

RUN echo osrm-customize....
RUN osrm-customize /data/berlin-latest.osrm 

RUN chmod 777 /start.sh

CMD [ "sh","/start.sh" ]

EXPOSE 5000