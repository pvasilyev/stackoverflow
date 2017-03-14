#!/bin/zsh

curl -XGET http://localhost:9200/my_cities/_search -d '
{
  "query": {
    "multi_match" : {
      "type":     "most_fields",
      "query":    "klaipeda",
      "fields": [ "name", "folded" ]
    }
  }
}'

curl -XGET http://localhost:9200/my_cities/_search -d '
{
  "query": {
    "multi_match" : {
      "type":     "most_fields",
      "query":    "Klaipėda",
      "fields": [ "name", "folded" ]
    }
  }
}'

echo '\n'

curl -XGET http://localhost:9200/my_cities/_search -d '
{
  "query": {
    "multi_match" : {
      "type":     "most_fields",
      "query":    "klaipedos",
      "fields": [ "name", "folded" ]
    }
  }
}'

curl -XGET http://localhost:9200/my_cities/_search -d '
{
  "query": {
    "multi_match" : {
      "type":     "most_fields",
      "query":    "Klaipėdos",
      "fields": [ "name", "folded" ]
    }
  }
}'

echo '\n'

curl -XGET http://localhost:9200/my_cities/_search -d '
{
  "query": {
    "multi_match" : {
      "type":     "most_fields",
      "query":    "klaipedoje",
      "fields": [ "name", "folded" ]
    }
  }
}'

curl -XGET http://localhost:9200/my_cities/_search -d '
{
  "query": {
    "multi_match" : {
      "type":     "most_fields",
      "query":    "Klaipėdoje",
      "fields": [ "name", "folded" ]
    }
  }
}'

echo '\n'
