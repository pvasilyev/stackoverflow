#!/bin/zsh

curl -XGET http://localhost:9200/my_cities/_analyze -d '
{
  "analyzer" : "md_folded_analyzer",
  "explain": true,
  "text" : ["Klaipėda", "Klaipėdos", "Klaipėdoje"]
}'

