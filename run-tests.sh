#!/bin/bash

apk --no-cache add curl
curl --location --output "./${POSTMAN_COLLECTION_ID}.json" \
  --request GET "https://api.getpostman.com/collections/${POSTMAN_COLLECTION_ID}" \
  --header "x-api-key: ${POSTMAN_API_TOKEN}"

newman run "./${POSTMAN_COLLECTION_ID}.json" -k \
  -r htmlextra,cli \
  --reporter-htmlextra-export "./output/${POSTMAN_COLLECTION_ID}_tests.html" \
  --reporter-htmlextra-title "${POSTMAN_COLLECTION_ID} test results"

docker run \
  -v $PWD/output:/home/newman/output \
  -e POSTMAN_COLLECTION_ID=12935478-57412484-fa32-4a78-9b2c-19b6dfb47fef \
  -e POSTMAN_API_TOKEN=PMAK-5ff1b6906359f7003f6bb187-86dbd71793c2d8d603383829f9e973c758 \
  tests:latest