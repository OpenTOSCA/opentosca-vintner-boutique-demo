#! /usr/bin/bash
set -e

# Set working directory
cd "$(dirname "$0")"
cd ../

# Tag
TAG=v6
if [ -z "${TAG}" ]; then
  echo "TAG not defined"
  exit 1
fi

# Registry
REGISTRY=milesstoetzner
if [ -z "${REGISTRY}" ]; then
  echo "REGISTRY not defined"
  exit 1
fi

# Checkout
docker build -t ${REGISTRY}/boutique-checkout:${TAG} src/checkout
docker push ${REGISTRY}/boutique-checkout:${TAG}

# Cart
docker build -t ${REGISTRY}/boutique-cart:${TAG} src/cart/src
docker push ${REGISTRY}/boutique-cart:${TAG}

# Payment
docker build -t ${REGISTRY}/boutique-payment:${TAG} src/payment
docker push ${REGISTRY}/boutique-payment:${TAG}

# Frontend
docker build -t ${REGISTRY}/boutique-frontend:${TAG} src/frontend
docker push ${REGISTRY}/boutique-frontend:${TAG}

# Recommendation
docker build -t ${REGISTRY}/boutique-recommendation:${TAG} src/recommendation
docker push ${REGISTRY}/boutique-recommendation:${TAG}

# Analytics
docker build -t ${REGISTRY}/boutique-analytics:${TAG} src/analytical
docker push ${REGISTRY}/boutique-analytics:${TAG}
