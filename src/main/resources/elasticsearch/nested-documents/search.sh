#!/bin/zsh

curl -XGET http://localhost:9200/my_users/_search -d '
{
  "query": {
    "bool": {
      "must": [ {
        "nested": {
          "path": "usertag",
          "query": {
            "bool": {
              "must": [
                { "match": { "usertag.tag": "A" }},
                { "range" : {
                    "usertag.logcreatetime" : {
                      "gte": "2017-01-12",
                      "lte": "2017-01-19"
                    }
                }}
              ]
            }
          }
        }
      }, {
        "nested": {
          "path": "usertag",
          "query": {
            "bool": {
              "must": [
                { "match": { "usertag.tag": "B" }}
              ]
            }
          }
        }
      }]
    }
  }
}'

#curl -XGET http://localhost:9200/my_users/_search -d '
#{
#  "query": {
#    "match_all": {}
#  }
#}'
