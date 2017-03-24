#!/usr/local/bin/zsh

curl -XDELETE http://localhost:9200/my_wineries

curl -XPUT localhost:9200/my_wineries -d '
{
  "settings": {
    "analysis": {
      "analyzer": {
        "my_analyzer": {
          "type": "custom",
          "tokenizer": "custom_tokenizer",
          "filter": [
            "lowercase",
            "trim"
          ]
        }
      },
      "tokenizer": {
        "custom_tokenizer": {
          "type": "nGram",
          "min_gram": "3",
          "max_gram": "8",
          "token_chars": [
            "letter",
            "digit"
          ]
        }
      }
    }
  },
  "mappings": {
    "winery": {
      "properties": {
        "name": {
          "type": "text",
          "analyzer": "my_analyzer"
        },
        "searchable": {
          "type": "text",
          "analyzer": "standard"
        }
      }
    }
  }
}'

curl -XPOST http://localhost:9200/my_wineries/winery/ -d '
{
  "name": "Quinta da Romaneira"
}'

curl -XPOST http://localhost:9200/my_wineries/winery/ -d '
{
  "name": "Pinteveira"
}'
