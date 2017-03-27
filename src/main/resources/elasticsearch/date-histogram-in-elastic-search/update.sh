#!/usr/local/bin/zsh

curl -XDELETE http://localhost:9200/my_hist

curl -XPUT localhost:9200/my_hist -d '
{
  "mappings": {
    "hist": {
      "properties": {
        "timestamp": {
          "type": "date"
        }
      }
    }
  }
}'

echo ''

curl -XPOST http://localhost:9200/my_hist/hist/ -d '
{
  "timestamp": "2017-03-23T05:03:20Z"
}'

curl -XPOST http://localhost:9200/my_hist/hist/ -d '
{
  "timestamp": "2017-03-23T06:13:20Z"
}'

curl -XPOST http://localhost:9200/my_hist/hist/ -d '
{
  "timestamp": "2017-03-23T08:43:30Z"
}'

echo ''

curl -XPOST http://localhost:9200/my_hist/hist/ -d '
{
  "timestamp": "2017-03-22T15:03:20Z"
}'

curl -XPOST http://localhost:9200/my_hist/hist/ -d '
{
  "timestamp": "2017-03-22T16:13:20Z"
}'

curl -XPOST http://localhost:9200/my_hist/hist/ -d '
{
  "timestamp": "2017-03-22T17:43:30Z"
}'

echo ''

curl -XPOST http://localhost:9200/my_hist/hist/ -d '
{
  "timestamp": "2017-03-21T15:03:20Z"
}'

curl -XPOST http://localhost:9200/my_hist/hist/ -d '
{
  "timestamp": "2017-03-21T16:13:20Z"
}'

curl -XPOST http://localhost:9200/my_hist/hist/ -d '
{
  "timestamp": "2017-03-21T17:43:30Z"
}'