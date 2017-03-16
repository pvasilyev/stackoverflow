#!/usr/local/bin/zsh

curl -XDELETE http://localhost:9200/my_blog_1

curl -XPUT http://localhost:9200/my_blog_1 -d '
{
  "mappings": {
    "blog": {
      "properties": {
        "comments": {
          "type": "nested",
          "properties": {
            "subComments": {
              "type": "nested"
            }
          }
        }
      }
    }
  }
}'


curl -XPUT http://localhost:9200/my_blog_1/blog/1 -d '
{
  "blog_post_id": "blog1",
  "comments": [
    {
      "id": "c1",
      "user_id": "u1",
      "timestamp": 1487781975676,
      "value": "CVLA1",
      "subComments": [
        {
          "value": "sub comment 1"
        },
        {
          "value": "sub comment 2"
        }
      ]
    },
    {
      "id": "c2",
      "user_id": "u1",
      "timestamp": 1487781975686,
      "value": "CVLA2",
      "subComments": [
        {
          "value": "sub comment 3"
        },
        {
          "value": "sub comment 4"
        }
      ]
    }
  ]
}'