#!/bin/zsh

curl -XGET http://localhost:9200/my_animals/_search -d '
{
    "query": {
        "prefix": {
            "Title": "ti"
        }
    }
}'

