#!/bin/zsh

curl -XDELETE http://localhost:9200/my_fields

curl -XPUT http://localhost:9200/my_fields -d '
{
  "mappings": {
    "field": {
      "properties": {
        "name": {
          "type": "keyword",
          "fields": {
            "raw": {
              "type": "keyword"
            }
          }
        }
      }
    }
  }
}'

curl -XPOST http://localhost:9200/my_fields/field/ -d '
{
  "name": "Alice"
}'

echo ''

curl -XPOST http://localhost:9200/my_fields/field/ -d '
{
  "name": "Bob"
}'

echo ''

curl -XPOST http://localhost:9200/my_fields/field/ -d '
{
  "name": "Charlie"
}'

echo ''
