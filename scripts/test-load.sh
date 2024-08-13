#! /usr/bin/bash
set -e

# Set working directory
cd "$(dirname "$0")"
cd ../

if [ -z "${FRONTEND_ENDPOINT}" ]; then
  echo "FRONTEND_ENDPOINT not defined"
  exit 1
fi

docker compose -f ./loadgenerator/docker-compose.yaml up
