#!/usr/local/bin/zsh

curl -XGET http://localhost:9200/my_wineries/_search -d '
{
  "query": {
    "bool": {
      "must": [ {
        "match": {
          "name": "Quinta da Romaneira"
        }
      } ],
      "minimum_should_match": "75%"
    }
  },
  "sort": {
    "_score": {
      "order": "desc"
    }
  }
}'

echo ''

curl -XGET http://localhost:9200/my_wineries/_search -d '
{
  "query": {
    "match": {
      "searchable": {
        "query": "quinta da romaneira"
      }
    }
  }
}'

