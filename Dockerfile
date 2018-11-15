# FROM alpine:latest

FROM osrm/osrm-backend

RUN apt-get update 

RUN apt-get install -y wget

ARG ADDRESS


RUN wget ${ADDRESS} -O  /data/map-latest.osm.pdf


COPY ./start.sh /start.sh


COPY ./car.lua /data/car.lua

WORKDIR /opt

RUN echo osrm-extract.....
RUN osrm-extract /data/map-latest.osm.pbf -p /data/car.lua


RUN echo osrm-partition...
RUN osrm-partition /data/map-latest.osrm

RUN echo osrm-customize....
RUN osrm-customize /data/map-latest.osrm 

RUN chmod 777 /start.sh

CMD [ "sh","/start.sh" ]

EXPOSE 5000