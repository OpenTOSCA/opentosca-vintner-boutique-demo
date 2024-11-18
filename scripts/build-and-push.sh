#! /usr/bin/bash
set -e

# Set working directory
cd "$(dirname "$0")"
cd ../

# Tag
TAG=v10
if [ -z "${TAG}" ]; then
  echo "TAG not defined"
  exit 1
fi

# Registry
REGISTRY=ghcr.io/opentosca/opentosca-vintner-boutique-demo
if [ -z "${REGISTRY}" ]; then
  echo "REGISTRY not defined"
  exit 1
fi

# Advertisement
docker build -t ${REGISTRY}:advertisement-${TAG} src/advertisement
docker push ${REGISTRY}:advertisement-${TAG}

# Analytics
docker build -t ${REGISTRY}:analytics-${TAG} src/analytics
docker push ${REGISTRY}:analytics-${TAG}

# Cart
docker build -t ${REGISTRY}:cart-${TAG} src/cart/src
docker push ${REGISTRY}:cart-${TAG}

# Checkout
docker build -t ${REGISTRY}:checkout-${TAG} src/checkout
docker push ${REGISTRY}:checkout-${TAG}

# Currency
docker build -t ${REGISTRY}:currency-${TAG} src/currency
docker push ${REGISTRY}:currency-${TAG}

# Email
docker build -t ${REGISTRY}:email-${TAG} src/email
docker push ${REGISTRY}:email-${TAG}

# Frontend
docker build -t ${REGISTRY}:frontend-${TAG} src/frontend
docker push ${REGISTRY}:frontend-${TAG}

# Load Generator
docker build -t ${REGISTRY}:loadgenerator-${TAG} src/loadgenerator
docker push ${REGISTRY}:loadgenerator-${TAG}

# Payment
docker build -t ${REGISTRY}:payment-${TAG} src/payment
docker push ${REGISTRY}:payment-${TAG}

# Product
docker build -t ${REGISTRY}:product-${TAG} src/product
docker push ${REGISTRY}:product-${TAG}

# Recommendation
docker build -t ${REGISTRY}:recommendation-${TAG} src/recommendation
docker push ${REGISTRY}:recommendation-${TAG}

# Shipping
docker build -t ${REGISTRY}:shipping-${TAG} src/shipping
docker push ${REGISTRY}:shipping-${TAG}
