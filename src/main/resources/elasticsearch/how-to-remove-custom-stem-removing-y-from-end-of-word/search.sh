#!/bin/zsh

curl -XGET http://localhost:9200/my_test_01/_search -d '
{
    "query": {
        "match": { "name" : "nift" }
    }
}'

