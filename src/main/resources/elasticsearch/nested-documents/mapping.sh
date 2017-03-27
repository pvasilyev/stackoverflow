#!/bin/zsh

curl -XDELETE http://localhost:9200/my_users

curl -XPUT http://localhost:9200/my_users -d '
{
    "mappings": {
        "type1" : {
            "properties" : {
                "usertag" : {
                    "type" : "nested"
                }
            }
        }
    }
}'
