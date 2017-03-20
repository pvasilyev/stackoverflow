#!/bin/zsh

curl -XDELETE http://localhost:9200/my_animals

curl -XPUT http://localhost:9200/my_animals -d '
{
   "settings":{
      "analysis":{
         "analyzer":{
            "my_analyzer":{
               "type":"custom",
               "tokenizer":"keyword",
               "filter":[
                  "lowercase"
               ]
            }
         }
      }
   },
  "mappings": {
    "animal": {
      "properties": {
        "Title": {
          "type":     "string",
          "analyzer": "my_analyzer"
        }
      }
    }
  }
}'

curl -XPUT http://localhost:9200/my_animals/animal/1 -d '
{
  "Title": "Tiger"
}'

curl -XPUT http://localhost:9200/my_animals/animal/2 -d '
{
  "Title": "Timber wolf"
}'

curl -XPUT http://localhost:9200/my_animals/animal/3 -d '
{
  "Title": "Tiger snake"
}'

curl -XPUT http://localhost:9200/my_animals/animal/4 -d '
{
  "Title": "Eye of a tiger"
}'
