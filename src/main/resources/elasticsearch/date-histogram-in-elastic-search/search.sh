#!/usr/local/bin/zsh

curl -XGET "http://localhost:9200/my_hist/_search?pretty" -d '
{
  "size": 0,
  "query": {
    "range" : {
      "timestamp" : {
        "gte": "now-2d"
      }
    }
  },
  "aggs": {
    "range_aggs": {
      "date_histogram": {
        "field": "timestamp",
        "interval": "hour"
      }
    }
  }
}'
