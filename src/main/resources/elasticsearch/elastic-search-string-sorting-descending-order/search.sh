#!/bin/zsh

curl -XGET "http://localhost:9200/my_fields/_search?pretty" -d '
{
    "query": {
        "match_all": {}
    },
    "sort": [
       {
          "name.raw": {
             "order": "desc"
          }
       }
    ]
}'
