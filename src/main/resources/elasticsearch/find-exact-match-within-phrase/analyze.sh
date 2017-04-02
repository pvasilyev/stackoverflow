#!/bin/zsh

curl -XGET http://localhost:9200/my_zoo/_analyze -d '
{
  "analyzer" : "my_analyzer",
  "explain": true,
  "text" : ["fox"]
}'

