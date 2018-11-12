# FROM alpine:latest

FROM osrm/osrm-backend

RUN apt-get update 

RUN apt-get install -y wget

RUN mkdir data
WORKDIR  /data

RUN wget http://download.geofabrik.de/europe/germany/berlin-latest.osm.pbf

WORKDIR /

COPY ./start.sh ./start.sh

COPY ./car.lua ./data/car.lua



RUN chmod 777 ./start.sh

CMD [ "sh","./start.sh" ]

EXPOSE 5000