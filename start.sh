# echo osrm-extract.....
# docker run -t -v $(pwd):/data osrm/osrm-backend osrm-extract -p /opt/car.lua /data/pennsylvania-latest.osm.pbf


# echo osrm-partition...
# docker run -t -v $(pwd):/data osrm/osrm-backend osrm-partition /data/pennsylvania-latest.osm.pbf


# echo osrm-customize....
# wget http://download.geofabrik.de/north-america/us/pennsylvania-latest.osm.pbf
# docker run -t -v $(pwd):/data osrm/osrm-backend osrm-extract -p /opt/car.lua /data/pennsylvania-latest.osm.pbf
# docker run -t -v $(pwd):/data osrm/osrm-backend osrm-partition /data/pennsylvania-latest.osm.pbf
# docker run -t -v $(pwd):/data osrm/osrm-backend osrm-customize /data/pennsylvania-latest.osm.pbf
# docker run -t -i -d --name osrm-pennsylvania --restart=always -p 5010:5000 -v $(pwd):/data osrm/osrm-backend osrm-routed --algorithm mld /data/pennsylvania-latest.osm.pbf 


# echo osrm-routed.....




# docker run -t -i -p 5000:5000 -v $(pwd):/data osrm/osrm-backend osrm-routed --algorithm mld /data/pennsylvania-latest.osm.pbf



# echo osrm-extract.....
# osrm-extract /data/berlin-latest.osm.pbf -p /data/car.lua

apt-get update && apt-get install wget

mkdir data
cd data

wget http://download.geofabrik.de/europe/germany/berlin-latest.osm.pbf

ls

cd ..

echo osrm-partition...
osrm-partition /data/berlin-latest.osrm

echo osrm-customize....
osrm-customize /data/berlin-latest.osrm

echo osrm-routed.....

osrm-routed --algorithm=MLD /data/berlin-latest.osrm
