#!/usr/local/bin/zsh

curl -XPUT http://localhost:9200/my_users/type1/1 -d '
{
    "userid": "1",
    "usertag": [
        {
            "tag": "A",
            "logcreatetime": "2017-01-14T00:00:00Z"
        },
        {
            "tag": "C",
            "logcreatetime": "2017-01-17T00:00:00Z"
        }
    ]
}'

curl -XPUT http://localhost:9200/my_users/type1/2 -d '
{
    "userid": "2",
    "usertag": [
        {
            "tag": "A",
            "logcreatetime": "2017-01-12T00:00:00Z"
        },
        {
            "tag": "B",
            "logcreatetime": "2017-01-19T00:00:00Z"
        }
    ]
}'