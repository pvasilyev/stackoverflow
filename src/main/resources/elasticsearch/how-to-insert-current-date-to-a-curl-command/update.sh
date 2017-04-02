#!/bin/zsh

curl -XDELETE "http://localhost:9200/2017.04.01"

curl -XPUT "http://localhost:9200/2017.04.01" -d '
{
  "mappings": {
    "task": {
      "properties": {
        "name": {
          "type": "string"
        }
      }
    }
  }
}'

curl -XPOST http://localhost:9200/2017.04.01/task/ -d '
{
  "name": "test"
}'

