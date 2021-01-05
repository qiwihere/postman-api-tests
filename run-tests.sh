#!/bin/bash

apk --no-cache add curl
curl --location --output "./${POSTMAN_COLLECTION_ID}.json" \
  --request GET "https://api.getpostman.com/collections/${POSTMAN_COLLECTION_ID}" \
  --header "x-api-key: ${POSTMAN_API_TOKEN}"

newman run "./${POSTMAN_COLLECTION_ID}.json" -k \
  -r htmlextra,cli \
  --reporter-htmlextra-export "./output/${POSTMAN_COLLECTION_ID}_tests.html" \
  --reporter-htmlextra-title "${POSTMAN_COLLECTION_ID} test results"
