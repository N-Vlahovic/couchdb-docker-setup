#!/usr/bin/env bash
curl -X POST \
  --header "Content-Type: application/json" \
  --data '{"_id": "org.couchdb.user:${COUCHDB_USER}", "name": "${COUCHDB_USER}", "password": "${COUCHDB_PASSWORD}", "type": "user", "roles": ["admin"]}' \
  "http://${COUCHDB_USER}:${COUCHDB_PASSWORD}@localhost:${COUCHDB_PORT}/_users"
