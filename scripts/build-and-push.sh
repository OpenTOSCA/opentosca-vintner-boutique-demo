#! /usr/bin/bash
set -e

# Set working directory
cd "$(dirname "$0")"
cd ../

# Tag
TAG=v8
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

# Advertisement
docker build -t ${REGISTRY}/boutique-advertisement:${TAG} src/advertisement
docker push ${REGISTRY}/boutique-advertisement:${TAG}

# Analytics
docker build -t ${REGISTRY}/boutique-analytics:${TAG} src/analytical
docker push ${REGISTRY}/boutique-analytics:${TAG}

# Cart
docker build -t ${REGISTRY}/boutique-cart:${TAG} src/cart/src
docker push ${REGISTRY}/boutique-cart:${TAG}

# Checkout
docker build -t ${REGISTRY}/boutique-checkout:${TAG} src/checkout
docker push ${REGISTRY}/boutique-checkout:${TAG}

# Currency
docker build -t ${REGISTRY}/boutique-currency:${TAG} src/currency
docker push ${REGISTRY}/boutique-currency:${TAG}

# Email
docker build -t ${REGISTRY}/boutique-email:${TAG} src/email
docker push ${REGISTRY}/boutique-email:${TAG}

# Frontend
docker build -t ${REGISTRY}/boutique-frontend:${TAG} src/frontend
docker push ${REGISTRY}/boutique-frontend:${TAG}

# Load Generator
docker build -t ${REGISTRY}/boutique-loadgenerator:${TAG} src/loadgenerator
docker push ${REGISTRY}/boutique-loadgenerator:${TAG}

# Payment
docker build -t ${REGISTRY}/boutique-payment:${TAG} src/payment
docker push ${REGISTRY}/boutique-payment:${TAG}

# Product
docker build -t ${REGISTRY}/boutique-product:${TAG} src/product
docker push ${REGISTRY}/boutique-product:${TAG}

# Recommendation
docker build -t ${REGISTRY}/boutique-recommendation:${TAG} src/recommendation
docker push ${REGISTRY}/boutique-recommendation:${TAG}

# Shipping
docker build -t ${REGISTRY}/boutique-shipping:${TAG} src/shipping
docker push ${REGISTRY}/boutique-shipping:${TAG}
