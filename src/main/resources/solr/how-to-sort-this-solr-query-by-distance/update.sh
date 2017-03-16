#!/usr/local/bin/zsh

curl -X POST -H 'Content-type: application/json' "http://localhost:8983/solr/gettingstarted/update?commit=true" -d '{ "delete": { "query" : "*:*" } }'

curl -X POST -H 'Content-type: application/json' "http://localhost:8983/solr/gettingstarted/update?commit=true" -d @import-data.json