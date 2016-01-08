#!/bin/bash

# build the flask container
docker build -t prakhar1989/flask-app .

# create the network
docker network create foodtrucks

# start the ES container
docker run -d --net foodtrucks -p 9200:9200 -p 9300:9300 --name es elasticsearch

# start the flask app container
docker run -d --net foodtrucks -p 5000:5000 --name flask-app prakhar1989/flask-app