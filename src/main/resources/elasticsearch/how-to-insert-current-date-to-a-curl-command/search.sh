#!/bin/zsh

curl -XGET "http://localhost:9200/`date -u +%Y.%m.%d`/_search" -d '
{
    "query": {
        "match_all": {}
    }
}'

