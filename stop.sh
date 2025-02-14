#!/bin/bash
export $(grep -v '^#' .env | xargs)
export HASHED_PASSWORD=$(openssl passwd -apr1 "$PASSWORD")

docker compose -f docker-compose.traefik.yml down
docker compose -f docker-compose.yml down