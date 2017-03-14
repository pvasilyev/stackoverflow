#!/bin/zsh

curl -XDELETE http://localhost:9200/my_cities

curl -XPUT http://localhost:9200/my_cities -d '
{
  "mappings": {
    "city": {
      "properties": {
        "name": {
          "type":     "string",
          "analyzer": "lithuanian",
          "copy_to": "folded"
        },
        "folded": {
          "type": "string",
          "analyzer": "md_folded_analyzer"
        }
      }
    }
  },
  "settings": {
      "analysis": {
        "filter": {
          "lithuanian_stop": {
            "type":       "stop",
            "stopwords":  "_lithuanian_"
          },
          "lithuanian_stemmer": {
            "type":       "stemmer",
            "language":   "lithuanian"
          }
        },
        "analyzer": {
          "md_folded_analyzer": {
            "type": "custom",
            "tokenizer": "standard",
            "filter":  [
              "lowercase",
              "lithuanian_stop",
              "lithuanian_stemmer",
              "asciifolding"
            ]
          }
        }
     }
  }
}'

curl -XPUT http://localhost:9200/my_cities/city/1 -d '
{
  "name": "Klaipėda"
}'
