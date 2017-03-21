#!/usr/local/bin/zsh

curl -XDELETE http://localhost:9200/world

curl -XPUT 'localhost:9200/world' -d '
{
  "mappings" : {
    "port": {
      "properties": {
        "name": {
          "type": "string"
        },
        "suggest": {
          "type": "completion",
          "analyzer": "simple",
          "preserve_separators": true,
          "preserve_position_increments": true,
          "max_input_length": 50,
          "contexts": [
            {
              "name": "port_type",
              "type": "category",
              "path": "name"
            }
          ]
        }
      }
    }
  }
}'
