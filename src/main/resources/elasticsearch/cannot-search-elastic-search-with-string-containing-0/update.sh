#!/usr/local/bin/zsh

curl -XDELETE http://localhost:9200/my_pids

curl -XPUT http://localhost:9200/my_pids -d '
{
  "mappings": {
    "pid": {
      "properties": {
        "PID": {
          "type": "text",
          "analyzer": "keyword",
          "fields": {
            "keyword": {
              "type": "keyword",
              "ignore_above": 256
            }
          }
        }
      }
    }
  }
}'

curl -XPOST http://localhost:9200/my_pids/pid/ -d '
{
  "PID": "21.11101/0000-0000-9B71-2"
}'
