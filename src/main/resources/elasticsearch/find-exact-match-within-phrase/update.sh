#!/bin/zsh

curl -XDELETE http://localhost:9200/my_zoo

curl -XPUT http://localhost:9200/my_zoo -d '
{
   "settings":{
      "analysis":{
         "analyzer":{
            "my_analyzer":{
               "type":"custom",
               "tokenizer":"standard",
               "filter":[
                  "standard",
                  "lowercase",
                  "my_snowball"
               ]
            }
         },
         "filter": {
            "my_snowball": {
              "type": "snowball",
              "language": "English"
            }
         }
      }
   },
  "mappings": {
    "animal": {
      "properties": {
        "text": {
          "type":     "text",
          "analyzer": "standard",
          "term_vector": "yes"
        }
      }
    }
  }
}'

curl -XPOST http://localhost:9200/my_zoo/animal/ -d '
{
  "text": "dinosaur"
}'

curl -XPOST http://localhost:9200/my_zoo/animal/ -d '
{
  "text": "dog"
}'

curl -XPOST http://localhost:9200/my_zoo/animal/ -d '
{
  "text": "fox"
}'

curl -XPOST http://localhost:9200/my_zoo/animal/ -d '
{
  "text": "cat"
}'

curl -XPOST http://localhost:9200/my_zoo/animal/ -d '
{
  "text": "browny"
}'

curl -XPOST http://localhost:9200/my_zoo/animal/ -d '
{
  "text": "quick"
}'

curl -XPOST http://localhost:9200/my_zoo/animal/ -d '
{
  "text": "lazy cow"
}'
