#!/bin/zsh

curl -XDELETE http://localhost:9200/my_test_01

curl -XPUT http://localhost:9200/my_test_01 -d '
{
  "settings": {
    "analysis": {
      "analyzer" : {
                "my_analyzer" : {
                    "tokenizer" : "standard",
                    "filter" : ["standard", "lowercase", "my_stemmer"]
                }
            },
            "filter" : {
                "my_stemmer" : {
                    "type" : "stemmer",
                    "name" : "lovins"
                }
            }
    }
  },
  "mappings": {
    "stem": {
      "properties": {
        "name": {
          "type": "text",
          "analyzer": "my_analyzer"
        }
      }
    }
  }
}'

curl -XPOST http://localhost:9200/my_test_01/stem/ -d '
{
  "name": "Funky"
}'

curl -XPOST http://localhost:9200/my_test_01/stem/ -d '
{
  "name": "Funny"
}'

curl -XPOST http://localhost:9200/my_test_01/stem/ -d '
{
  "name": "Generally"
}'

curl -XPOST http://localhost:9200/my_test_01/stem/ -d '
{
  "name": "Doggy"
}'

curl -XPOST http://localhost:9200/my_test_01/stem/ -d '
{
  "name": "Clumsy"
}'

curl -XPOST http://localhost:9200/my_test_01/stem/ -d '
{
  "name": "prohibitively"
}'

curl -XPOST http://localhost:9200/my_test_01/stem/ -d '
{
  "name": "singlehandedly"
}'

curl -XPOST http://localhost:9200/my_test_01/stem/ -d '
{
  "name": "arbitrarily"
}'

curl -XPOST http://localhost:9200/my_test_01/stem/ -d '
{
  "name": "nifty"
}'

