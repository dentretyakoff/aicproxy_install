#!/bin/bash
export $(grep -v '^#' .env | xargs)
export HASHED_PASSWORD=$(openssl passwd -apr1 "$PASSWORD")

docker network create traefik-public
docker compose -f docker-compose.traefik.yml up -d

docker compose -f docker-compose.yml up -d --build
