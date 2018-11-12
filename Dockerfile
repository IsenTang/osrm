
FROM alpine:latest


FROM osrm/osrm-backend

COPY ./start.sh ./start.sh


RUN chmod 777 ./start.sh

CMD [ "sh","./start.sh" ]

EXPOSE 5000