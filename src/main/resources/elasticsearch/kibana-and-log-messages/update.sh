#!/bin/zsh

curl -XPUT http://localhost:9200/my_logs/log/1 -d '
{
    "logid": "1",
    "message": "2014-07-02 20:52:39 INFO home.helloworld: LOGGER/LOG:ID1234 has successfully been received, {\"uuid\"=\"abc123\"}"
}'

curl -XPUT http://localhost:9200/my_logs/log/2 -d '
{
    "logid": "2",
    "message": "2014-07-02 20:52:39 INFO home.helloworld: LOGGER/LOG:ID1234 has successfully been transferred, {\"uuid\"=\"abc123\"}"
}'

curl -XPUT http://localhost:9200/my_logs/log/3 -d '
{
    "logid": "3",
    "message": "2014-07-02 20:52:39 INFO home.byebyeworld: LOGGER/LOG:ID1234 has successfully been processed, {\"uuid\"=\"abc123\"}"
}'

curl -XPUT http://localhost:9200/my_logs/log/4 -d '
{
    "logid": "4",
    "message": "2014-07-02 20:52:39 INFO home.byebyeworld: LOGGER/LOG:ID1234 has exited, {\"uuid\"=\"abc123\"}"
}'

curl -XPUT http://localhost:9200/my_logs/log/5 -d '
{
    "logid": "5",
    "message": "2014-07-02 20:53:00 INFO home.helloworld: LOGGER/LOG:ID1234 has successfully been received, {\"uuid\"=\"def123\"}"
}'

curl -XPUT http://localhost:9200/my_logs/log/6 -d '
{
    "logid": "6",
    "message": "2014-07-02 20:53:00 INFO home.helloworld: LOGGER/LOG:ID1234 has successfully been transferred, {\"uuid\"=\"def123\"}"
}'

curl -XPUT http://localhost:9200/my_logs/log/7 -d '
{
    "logid": "7",
    "message": "2014-07-02 20:53:00 INFO home.byebyeworld: LOGGER/LOG:ID1234 has successfully been processed, {\"uuid\"=\"def123\"}"
}'

curl -XPUT http://localhost:9200/my_logs/log/8 -d '
{
    "logid": "8",
    "message": "2014-07-02 20:53:00 INFO home.byebyeworld: LOGGER/LOG:ID1234 has exited, {\"uuid\"=\"def123\"}"
}'
