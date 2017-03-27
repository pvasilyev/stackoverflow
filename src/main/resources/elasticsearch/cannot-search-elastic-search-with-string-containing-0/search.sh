#!/usr/local/bin/zsh

curl -XGET http://localhost:9200/my_pids/_search -d '
{
  "query": {
    "prefix": {
      "PID" : "21.11101/000"
    }
  }
}'

