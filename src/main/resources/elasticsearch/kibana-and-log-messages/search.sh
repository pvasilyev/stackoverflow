#!/bin/zsh

# both queries will do the job actually.

curl -XGET http://localhost:9200/my_logs/_search -d '
{
   "query" : {
      "constant_score" : {
         "filter" : {
            "bool" : {
              "must" : [
                 { "match_phrase_prefix" : {"message" : "home.helloworld:"}},
                 { "match_phrase_prefix" : {"message" : "LOGGER/LOG:ID1234"}},
                 { "match_phrase_prefix" : {"received, {\"uuid\"=\"abc123\""}}
              ]
           }
         }
      }
   }
}'


curl -XGET http://localhost:9200/my_logs/_search -d '
{
   "query" : {
      "constant_score" : {
         "filter" : {
            "bool" : {
              "must" : [
                 { "match_phrase_prefix" : {"message" : "home.helloworld:"}},
                 { "match_phrase_prefix" : {"message" : "LOGGER/LOG:ID1234"}},
                 { "match" : {
                     "message" : {
                        "query": "received, {\"uuid\"=\"abc123\"",
                        "operator": "and"
                     }
                   }
                 }
              ]
           }
         }
      }
   }
}'
