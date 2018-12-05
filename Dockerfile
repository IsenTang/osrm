# FROM alpine:latest

FROM osrm/osrm-backend

RUN apt-get update 

RUN apt-get install -y wget

RUN wget https://dl.bintray.com/boostorg/release/1.67.0/source/boost_1_67_0.7z

RUN sudo apt-get install dtrx

RUN dtrx boost_1_67_0.7z

RUN ./bootstrap.sh --with-toolset=clang

RUN sudo ./b2 install

RUN sudo ldconfig /usr/local/lib

ARG ADDRESS

WORKDIR /data

RUN wget ${ADDRESS} -O map-latest.osm.pbf
 

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