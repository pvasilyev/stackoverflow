#!/usr/local/bin/zsh

curl -XGET http://localhost:9200/my_blog_1/_search -d '
{
  "query": {
    "nested": {
      "path": "comments",
      "query": {
        "bool": {
          "must": [
            {
              "match": {
                "comments.value": "CVLA1"
              }
            },
            {
              "nested": {
                "path": "comments.subComments",
                "query": {
                  "match": {
                    "comments.subComments.value": "sub comment 2"
                  }
                }
              }
            }
          ]
        }
      }
    }
  }
}'