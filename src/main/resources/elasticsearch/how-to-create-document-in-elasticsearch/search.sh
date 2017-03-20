#!/bin/zsh

curl -XGET http://localhost:9200/my_tasks/_search -d '
{
    "query": {
        "match_all": {}
    }
}'

