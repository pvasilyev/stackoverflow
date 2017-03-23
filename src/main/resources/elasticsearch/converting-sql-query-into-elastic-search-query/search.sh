#!/usr/local/bin/zsh

curl -XGET http://localhost:9200/ProductSearches/_search -d '
{
  "query": {
    "bool": {
      "must": [
        { "match": { "ProductId": "${productId}" }},
        { "range" : {
            "SearchDate" : {
              "gte": "${pasteDate}",
              "lte": "now"
            }
        }}
      ]
    }
  }
}'